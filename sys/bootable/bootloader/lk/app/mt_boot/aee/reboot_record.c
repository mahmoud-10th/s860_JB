#include <string.h>
#include "aee.h"
#include "kdump.h"
#include <platform/mrdump.h>

static int reboot_mode;
static struct kdump_params hw_reboot_params;
static struct kdump_crash_record hw_reboot_crash_record;

static bool sram_record_filled;

static void mrdump_query_bootinfo(void)
{
    if (!sram_record_filled) {
        reboot_mode = AEE_REBOOT_MODE_NORMAL;
        struct ram_console_buffer *bufp = (struct ram_console_buffer *) RAM_CONSOLE_ADDR;
	if (bufp->sig == RAM_CONSOLE_SIG) {
            reboot_mode = bufp->reboot_mode;
            bufp->reboot_mode = 0;
            memcpy(&hw_reboot_params, (const struct kdump_params *)bufp->kparams, sizeof(struct kdump_params));
	    if (memcmp(hw_reboot_params.sig, "MRDUMP00", 8) == 0) {
                memcpy(&hw_reboot_crash_record, hw_reboot_params.crash_record, sizeof(struct kdump_crash_record));
                hw_reboot_params.crash_record = &hw_reboot_crash_record;
            }
        }

        sram_record_filled = true;
    }
}

uint8_t aee_mrdump_get_reboot_mode(void)
{
    mrdump_query_bootinfo();
    return reboot_mode;
}

const struct kdump_params *aee_mrdump_get_params(void)
{
    mrdump_query_bootinfo();
    return &hw_reboot_params;
}

void mrdump_run(const struct mrdump_regset *per_cpu_regset, const struct mrdump_regpair *regpairs)
{
    mrdump_query_bootinfo();
    reboot_mode = AEE_REBOOT_MODE_WDT;

    memset(&hw_reboot_crash_record, 0, sizeof(struct kdump_crash_record));
    strcpy(hw_reboot_crash_record.msg, "HW_REBOOT");

    int i;
    for (i = 0; i < NR_CPUS; i++) {
        hw_reboot_crash_record.cpu_regs[i][0] = (unsigned long)per_cpu_regset[i].r0;
        hw_reboot_crash_record.cpu_regs[i][1] = (unsigned long)per_cpu_regset[i].r1;
        hw_reboot_crash_record.cpu_regs[i][2] = (unsigned long)per_cpu_regset[i].r2;
        hw_reboot_crash_record.cpu_regs[i][3] = (unsigned long)per_cpu_regset[i].r3;

        hw_reboot_crash_record.cpu_regs[i][4] = (unsigned long)per_cpu_regset[i].r4;
        hw_reboot_crash_record.cpu_regs[i][5] = (unsigned long)per_cpu_regset[i].r5;
        hw_reboot_crash_record.cpu_regs[i][6] = (unsigned long)per_cpu_regset[i].r6;
        hw_reboot_crash_record.cpu_regs[i][7] = (unsigned long)per_cpu_regset[i].r7;

        hw_reboot_crash_record.cpu_regs[i][8] = (unsigned long)per_cpu_regset[i].r8;
        hw_reboot_crash_record.cpu_regs[i][9] = (unsigned long)per_cpu_regset[i].r9;
        hw_reboot_crash_record.cpu_regs[i][10] = (unsigned long)per_cpu_regset[i].r10;
        hw_reboot_crash_record.cpu_regs[i][11] = (unsigned long)per_cpu_regset[i].fp;
        
        hw_reboot_crash_record.cpu_regs[i][12] = (unsigned long)per_cpu_regset[i].r12;
        hw_reboot_crash_record.cpu_regs[i][13] = (unsigned long)per_cpu_regset[i].sp;
        hw_reboot_crash_record.cpu_regs[i][14] = (unsigned long)per_cpu_regset[i].lr;
        hw_reboot_crash_record.cpu_regs[i][15] = (unsigned long)per_cpu_regset[i].pc;

        hw_reboot_crash_record.cpu_regs[i][16] = (unsigned long)per_cpu_regset[i].cpsr;
    }

    aee_kdump_detection();
}

