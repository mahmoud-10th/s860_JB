cmd_arch/arm/kernel/vmlinux.lds := /home/mahmoud/prebuilts/gcc/linux-x86/arm/arm-linux-eabi-linaro-4.9/bin/arm-eabi-gcc -E -Wp,-MD,arch/arm/kernel/.vmlinux.lds.d  -nostdinc -isystem /home/mahmoud/prebuilts/gcc/linux-x86/arm/arm-linux-eabi-linaro-4.9/bin/../lib/gcc/arm-eabi/4.9.4/include -I/S860_ROW_OpenSource/sys/kernel/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /S860_ROW_OpenSource/sys/kernel/include/linux/kconfig.h  -I../mediatek/platform/mt6582/kernel/core/include/ -I../mediatek/kernel/include/ -I../mediatek/custom/lenovo82_wet_jb5/common -I../mediatek/platform/mt6582/kernel/drivers/uart/ -I../mediatek/platform/mt6582/kernel/drivers/video/ -I../mediatek/platform/mt6582/kernel/drivers/dispsys/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/flashlight/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/core/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/vibrator/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/alsps/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/leds/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/camera/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/touchpanel/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/kpd/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/battery/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/rtc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/headset/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/accelerometer/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/dct/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/imgsensor/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/flashlight/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/cam_cal/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/cam_cal/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/sound/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/sound/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/barometer/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/ccci/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/alsps/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/ssw/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/ssw/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/jogball/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/leds/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/hdmi/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/gyroscope/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/eeprom/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/eeprom/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/magnetometer/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/imgsensor/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/lens/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/lens/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/headset/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/./ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/accelerometer/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/lcm/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/kernel/lcm/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/camera/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/audioflinger/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/sensors/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/lens/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/camera/inc/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/aal/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/imgsensor/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/flashlight/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/matv/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/cam_cal/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/combo/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/bluetooth/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/fmradio/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/eeprom/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/ant/ -I../mediatek/custom/out/lenovo82_wet_jb5/hal/vt/ -I../mediatek/custom/out/lenovo82_wet_jb5/common -D__KERNEL__   -mlittle-endian -Imediatek/platform/mt6582/kernel/core/include   -DTEXT_OFFSET=0x00008000 -P -C -Uarm -D__ASSEMBLY__ -DLINKER_SCRIPT -o arch/arm/kernel/vmlinux.lds arch/arm/kernel/vmlinux.lds.S

source_arch/arm/kernel/vmlinux.lds := arch/arm/kernel/vmlinux.lds.S

deps_arch/arm/kernel/vmlinux.lds := \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/hotplug.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/have/tcm.h) \
  include/asm-generic/vmlinux.lds.h \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/syscalls.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/pm/trace.h) \
    $(wildcard include/config/blk/dev/initrd.h) \
  /S860_ROW_OpenSource/sys/kernel/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /S860_ROW_OpenSource/sys/kernel/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /S860_ROW_OpenSource/sys/kernel/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/iwmmxt.h) \
  /S860_ROW_OpenSource/sys/kernel/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
  include/linux/const.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /S860_ROW_OpenSource/sys/kernel/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  arch/arm/include/generated/asm/sizes.h \
  include/asm-generic/sizes.h \
  ../mediatek/platform/mt6582/kernel/core/include/mach/memory.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /S860_ROW_OpenSource/sys/kernel/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/arm/lpae.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  include/asm-generic/getorder.h \

arch/arm/kernel/vmlinux.lds: $(deps_arch/arm/kernel/vmlinux.lds)

$(deps_arch/arm/kernel/vmlinux.lds):
