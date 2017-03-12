#include <cutils/xlog.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/mman.h>
#include <assert.h>
#include <stdlib.h>
#include <sys/stat.h>

#ifndef HAVE_AEE_FEATURE
#error "Must enable HAVE_AEE_FEATURE to use auto_sanity
#endif
#include "aee.h"

#define LOG_TAG "auto_sanity"
#define SANITY_PRINTF XLOGD

#ifdef MTK_MEMORY_COMPRESSION_SUPPORT
int zram_test(void)
{
    char zram_disksize[16];
    long long int disksize = 0;
    unsigned int disksizeKB = 0;
    int zram_fd = open("/sys/block/zram0/disksize", O_RDONLY);
    if(zram_fd < 0){
        SANITY_PRINTF("%s(%d) open device failed, zram_fd:%d, error: %s\n", __FUNCTION__, __LINE__, zram_fd, strerror(errno));
    	goto test_fail;
    }
        
    read(zram_fd, zram_disksize, sizeof(zram_disksize));
    disksize = strtoll(zram_disksize, NULL, 0);
    disksizeKB = (unsigned int)(disksize >> 10);

    SANITY_PRINTF("%s(%d) open device success, zram_fd:%d, zram size(KB):0x%x\n", __FUNCTION__, __LINE__, zram_fd, disksizeKB);
    if(disksizeKB <= 0) {
        goto test_fail;
    }
    
    close(zram_fd);
    return 0;    

test_fail:    
    aee_system_exception("Kernel", "/sys/block/zram0/disksize", 0, "zram_test failed");
    return -1;    
}
#endif //MTK_MEMORY_COMPRESSION_SUPPORT

#ifdef MTK_USE_RESERVED_EXT_MEM	
#define UIO_DEV "/dev/uio0"
#define UIO_ADDR "/sys/class/uio/uio0/maps/map0/addr"
#define UIO_SIZE "/sys/class/uio/uio0/maps/map0/size"
#define TESTSIZE (10*1024)

int ext_mem_alloc_test(void)
{
    int uio_fd, addr_fd, size_fd;
    int uio_size;
    void * uio_addr;
    char uio_addr_buf[16], uio_size_buf[16];
    
    uio_fd  = open(UIO_DEV,O_RDWR);
    addr_fd = open(UIO_ADDR, O_RDONLY);
    size_fd = open(UIO_SIZE, O_RDONLY);       

    if (uio_fd <0 || addr_fd <0 || size_fd <0){
    	SANITY_PRINTF("%s(%d) open device failed, uio_fd: %d, addr_fd: %d, size_fd: %d, error: %s\n", __FUNCTION__, __LINE__, uio_fd, addr_fd, size_fd, strerror(errno));
    	goto test_fail;
    }
    
    read(addr_fd, uio_addr_buf, sizeof(uio_addr_buf));
    read(size_fd, uio_size_buf, sizeof(uio_size_buf));
    uio_addr = (void*)strtoul(uio_addr_buf, NULL, 0);
    uio_size = (int)strtol(uio_size_buf, NULL, 0);
    
    SANITY_PRINTF("%s(%d) open device success, uio_addr:0x%x, uio_size:0x%x\n", __FUNCTION__, __LINE__, uio_addr, uio_size);

    void * vaddr = mmap(NULL, TESTSIZE, PROT_READ | PROT_WRITE, MAP_SHARED, uio_fd, 0); 
    if (vaddr == MAP_FAILED){
        SANITY_PRINTF("%s[%d] mmap falied, error: %s\n", __FUNCTION__, __LINE__, strerror(errno));
        close(uio_fd);
        goto test_fail;
    }

    int ret = munmap(vaddr, TESTSIZE);
    if(ret != 0)
    {
        SANITY_PRINTF("%s(%d) munmap falied, ret:%d error: %s\n", __FUNCTION__, __LINE__, ret, strerror(errno));
        goto test_fail;
    }
    
    SANITY_PRINTF("%s(%d) mmap/munmap success\n", __FUNCTION__, __LINE__);    
    
    close(uio_fd);
    return 0;

test_fail:    
    aee_system_exception("Kernel", "system/extras/autosanity/autosanity.c", 0, "ext_mem_alloc_test failed");
    return -1;
}
#endif //MTK_USE_RESERVED_EXT_MEM

static int getFreeMemoryImpl(const char* const sums[], const int sumsLen[], int num)
{
    int fd = open("/proc/meminfo", O_RDONLY);

    if (fd < 0) {
        SANITY_PRINTF("Unable to open /proc/meminfo");
        return 0;
    }

    char buffer[512] = {0};
    const int len = read(fd, buffer, sizeof(buffer)-1);
    close(fd);

    if (len < 0) {
        SANITY_PRINTF("Unable to read /proc/meminfo");
        return 0;
    }
    buffer[len] = 0;

    int numFound = 0;
    int mem = 0;

    char* p = buffer;
    while (*p && numFound < num) {
        int i = 0;
        while (sums[i]) {
            if (strncmp(p, sums[i], sumsLen[i]) == 0) {
                p += sumsLen[i];
                while (*p == ' ') p++;
                char* num = p;
                while (*p >= '0' && *p <= '9') p++;
                if (*p != 0) {
                    *p = 0;
                    p++;
                    if (*p == 0) p--;
                }
                mem += atoll(num) * 1024;
                numFound++;
                break;
            }
            i++;
        }
        p++;
    }

    return numFound > 0 ? mem : 0;
}

static void high_mem_test() {
    // Make sure if high zone exist, its size must be at least 8MB
    // otherwise there may have bizzare memory corruption issue.
    int aeeResult = 1;
    static const char* const sums[] = { "HighTotal:", NULL };
    static int sumsLen[] = { 0, 0 };
    sumsLen[0] = strlen("HighTotal:");
    const int highMemSize = getFreeMemoryImpl(sums, sumsLen, 1);
    SANITY_PRINTF("%s(%d) highmem size = %d\n", __FUNCTION__, __LINE__, highMemSize);
    if (highMemSize != 0 && highMemSize < (8 * 1024 * 1024)) {
        // TODO: Currently the return value of aee_system_exception() is unreliable.
        // It is possible that AED is busying processing other request and silently drops exception.
        // If it becomes reliable, we should retry until succeed.
        aeeResult = aee_system_exception("Kernel", "kernel/mm/highmem.c", 0, "Mem Config Error: HighTotal < 8MB");
        SANITY_PRINTF("%s(%d) aee_system_exception = %d\n", __FUNCTION__, __LINE__, aeeResult);
    }
    return;
}

static void ensure_aed_state() {
    // This function wait for AED ready
    SANITY_PRINTF("%s(%d) ensure_aed_state\n", __FUNCTION__, __LINE__);

    // wait for 30 secs. this is a workaround.
    sleep(30);

    /* 
     * Currently, aee_aed_is_ready() is not available.
     * So we simply wait for 30 secs for system to bootup.
     *
    int retryCount = 0;
    // max wait 30 * 2 secs
    while(30 > retryCount) {
        retryCount++;
        if(aee_aed_is_ready()) {
            SANITY_PRINTF("%s(%d) ensure_aed_state:ready\n", __FUNCTION__, __LINE__);
            // AED proc file ready, now wait a while for socket ready
            break;
        }
        sleep(2);
    }
    */

    SANITY_PRINTF("%s(%d) ensure_aed_state exit\n", __FUNCTION__, __LINE__);
    return;
}

int main(int argc, char *argv[]) {
    ensure_aed_state();

#ifdef MTK_MEMORY_COMPRESSION_SUPPORT   
        zram_test();
#endif

#ifdef MTK_USE_RESERVED_EXT_MEM	
        ext_mem_alloc_test();
#endif    

    high_mem_test();

    return 0;
}

