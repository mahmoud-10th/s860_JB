	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"bounds.c"
@ GNU C (Linaro GCC 4.9-2015.06) version 4.9.4 20150629 (prerelease) (arm-eabi)
@	compiled by GNU C version 4.8.2, GMP version 5.1.1, MPFR version 3.1.2, MPC version 1.0.1
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc
@ -I /S860_ROW_OpenSource/sys/kernel/arch/arm/include
@ -I arch/arm/include/generated -I include
@ -I ../mediatek/platform/mt6582/kernel/core/include/
@ -I ../mediatek/kernel/include/
@ -I ../mediatek/custom/lenovo82_wet_jb5/common
@ -I ../mediatek/platform/mt6582/kernel/drivers/uart/
@ -I ../mediatek/platform/mt6582/kernel/drivers/video/
@ -I ../mediatek/platform/mt6582/kernel/drivers/dispsys/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/flashlight/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/core/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/vibrator/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/alsps/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/leds/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/camera/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/touchpanel/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/kpd/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/battery/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/rtc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/headset/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/accelerometer/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/dct/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/imgsensor/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/flashlight/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/cam_cal/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/cam_cal/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/sound/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/sound/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/barometer/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/ccci/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/alsps/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/ssw/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/ssw/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/jogball/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/leds/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/hdmi/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/gyroscope/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/eeprom/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/eeprom/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/magnetometer/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/imgsensor/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/lens/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/lens/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/headset/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/./
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/accelerometer/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/lcm/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/kernel/lcm/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/camera/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/audioflinger/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/sensors/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/lens/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/camera/inc/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/aal/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/imgsensor/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/flashlight/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/matv/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/cam_cal/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/combo/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/bluetooth/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/fmradio/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/eeprom/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/ant/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/hal/vt/
@ -I ../mediatek/custom/out/lenovo82_wet_jb5/common
@ -I mediatek/platform/mt6582/kernel/core/include
@ -iprefix /home/mahmoud/prebuilts/gcc/linux-x86/arm/arm-linux-eabi-linaro-4.9/bin/../lib/gcc/arm-eabi/4.9.4/
@ -D__USES_INITFINI__ -D __KERNEL__ -D __LINUX_ARM_ARCH__=7 -U arm
@ -D MTK_BT_PROFILE_AVRCP -D MTK_GPS_SUPPORT -D MTK_FM_SUPPORT
@ -D MTK_USES_HD_VIDEO -D MTK_AUDIO_ADPCM_SUPPORT
@ -D MTK_GEMINI_SMART_3G_SWITCH -D MTK_BT_PROFILE_MANAGER
@ -D MTK_FM_RECORDING_SUPPORT -D MTK_NFC_SE_NUM -D MTK_IPV6_SUPPORT
@ -D MTK_BT_PROFILE_PBAP -D MTK_BT_PROFILE_PAN -D MTK_BT_PROFILE_A2DP
@ -D MTK_BT_PROFILE_HFP -D MTK_VOICE_UI_SUPPORT -D MTK_MASS_STORAGE
@ -D MTK_BICR_SUPPORT -D MTK_THEMEMANAGER_APP -D MTK_HDR_SUPPORT
@ -D HAVE_AACENCODE_FEATURE -D MTK_WIFI_HOTSPOT_SUPPORT
@ -D MTK_COMBO_SUPPORT -D MTK_BT_PROFILE_OPP
@ -D MTK_FLIGHT_MODE_POWER_OFF_MD -D MTK_SHARED_SDCARD
@ -D MTK_MULTI_STORAGE_SUPPORT -D MTK_WFD_SUPPORT
@ -D MTK_ENABLE_VIDEO_EDITOR -D MTK_AUDIO_RAW_SUPPORT -D MTK_WAPI_SUPPORT
@ -D MTK_FD_SUPPORT -D HAVE_ADPCMENCODE_FEATURE -D MTK_WFD_VIDEO_FORMAT
@ -D MTK_FACEBEAUTY_SUPPORT -D MTK_HANDSFREE_DMNR_SUPPORT
@ -D MTK_YAML_SCATTER_FILE_SUPPORT -D MTK_CAMERA_BSP_SUPPORT
@ -D MTK_DVFS_DISABLE_LOW_VOLTAGE_SUPPORT -D MTK_HIGH_QUALITY_THUMBNAIL
@ -D MTK_FM_RX_SUPPORT -D MTK_ENABLE_MD1 -D HAVE_XLOG_FEATURE
@ -D MTK_NO_NEED_USB_LED -D MTK_VOICE_UNLOCK_SUPPORT
@ -D MTK_MATV_ANALOG_SUPPORT -D MTK_AUTORAMA_SUPPORT
@ -D CUSTOM_KERNEL_ACCELEROMETER -D MTK_BT_SUPPORT -D MTK_VT3G324M_SUPPORT
@ -D MTK_KERNEL_POWER_OFF_CHARGING -D MTK_BT_PROFILE_HIDH
@ -D MTK_ION_SUPPORT -D MTK_PRODUCT_INFO_SUPPORT
@ -D MTK_CAMERA_APP_3DHW_SUPPORT -D MTK_WLAN_SUPPORT -D MTK_PQ_SUPPORT
@ -D MTK_TETHERINGIPV6_SUPPORT -D MTK_UART_USB_SWITCH -D MTK_IPOH_SUPPORT
@ -D MTK_USES_VR_DYNAMIC_QUALITY_MECHANISM -D MTK_PLATFORM_OPTIMIZE
@ -D MTK_SW_BTCVSD -D MTK_BT_PROFILE_SPP -D MTK_BT_30_SUPPORT
@ -D MTK_FAN5405_SUPPORT -D MTK_LCEEFT_SUPPORT -D MTK_BT_21_SUPPORT
@ -D MTK_DHCPV6C_WIFI -D HAVE_AWBENCODE_FEATURE
@ -D MTK_WEB_NOTIFICATION_SUPPORT -D MTK_MD_SHUT_DOWN_NT
@ -D MTK_SPH_EHN_CTRL_SUPPORT -D MTK_WB_SPEECH_SUPPORT
@ -D CUSTOM_KERNEL_ALSPS -D MTK_SENSOR_SUPPORT -D MTK_M4U_SUPPORT
@ -D MTK_EMMC_SUPPORT -D MTK_2SDCARD_SWAP -D MT6582 -D FM50AF
@ -D SENSORDRIVE -D DUMMY_LENS -D SENSORDRIVE -D CU_QHD
@ -D HX8389B_QHD_DSI_VDO_TIANMA -D HX8389B_QHD_DSI_VDO_TIANMA055XDHP
@ -D A5142_MIPI_RAW -D MTK_CONSYS_MT6582 -D MT6620 -D CONSTANT_FLASHLIGHT
@ -D SP0A19_YUV -D DUMMY_LENS -D MTK_AUDIO_BLOUD_CUSTOMPARAMETER_V4
@ -D A5142_MIPI_RAW -D SP0A19_YUV -D FM_DIGITAL_INPUT -D CONSYS_6582
@ -D MTK_GPS_MT6582 -D FM50AF -D FM_DIGITAL_OUTPUT -D MT6627_FM
@ -D MTK_SIM1_SOCKET_TYPE="1"
@ -D MTK_TOUCH_PHYSICAL_ROTATION_RELATIVE_TO_LCM="0"
@ -D MTK_LCM_PHYSICAL_ROTATION="0" -D MTK_NEON_SUPPORT="yes"
@ -D CUSTOM_KERNEL_SSW="ssw_single" -D MTK_SHARE_MODEM_SUPPORT="2"
@ -D LCM_HEIGHT="960" -D MTK_SHARE_MODEM_CURRENT="2" -D LCM_WIDTH="540"
@ -D MTK_SIM2_SOCKET_TYPE="1" -D CC_HAVE_ASM_GOTO -D KBUILD_STR(s)=#s
@ -D KBUILD_BASENAME=KBUILD_STR(bounds)
@ -D KBUILD_MODNAME=KBUILD_STR(bounds)
@ -isystem /home/mahmoud/prebuilts/gcc/linux-x86/arm/arm-linux-eabi-linaro-4.9/bin/../lib/gcc/arm-eabi/4.9.4/include
@ -include /S860_ROW_OpenSource/sys/kernel/include/linux/kconfig.h
@ -MD kernel/.bounds.s.d kernel/bounds.c -mlittle-endian -marm -mapcs
@ -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -march=armv7-a
@ -mfloat-abi=soft -mfpu=neon -auxbase-strip kernel/bounds.s -g -O2 -Wall
@ -Wundef -Wstrict-prototypes -Wno-trigraphs
@ -Werror=implicit-function-declaration -Wno-format-security
@ -Wframe-larger-than=1400 -Wno-unused-but-set-variable
@ -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-aliasing
@ -fno-common -fno-delete-null-pointer-checks -fno-pic -fno-dwarf2-cfi-asm
@ -fstack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls
@ -fno-strict-overflow -fconserve-stack -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments
@ -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
@ -fdefer-pop -fdevirtualize -fdevirtualize-speculatively -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime
@ -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
@ -fif-conversion -fif-conversion2 -findirect-inlining -finline
@ -finline-atomics -finline-functions-called-once -finline-small-functions
@ -fipa-cp -fipa-profile -fipa-pure-const -fipa-reference -fipa-sra
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -fmath-errno -fmerge-constants
@ -fmerge-debug-strings -fmove-loop-invariants -foptimize-strlen
@ -fpartial-inlining -fpeephole -fpeephole2 -fprefetch-loop-arrays
@ -freg-struct-return -freorder-blocks -freorder-functions
@ -frerun-cse-after-loop -fsched-critical-path-heuristic
@ -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
@ -fsched-last-insn-heuristic -fsched-pressure -fsched-rank-heuristic
@ -fsched-spec -fsched-spec-insn-heuristic -fsched-stalled-insns-dep
@ -fschedule-insns -fschedule-insns2 -fsection-anchors -fshow-column
@ -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
@ -fstack-protector -fstrict-volatile-bitfields -fsync-libcalls
@ -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
@ -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
@ -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
@ -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
@ -ftree-vrp -funit-at-a-time -fvar-tracking -fvar-tracking-assignments
@ -fverbose-asm -fzero-initialized-in-bss -mapcs-frame -marm
@ -mlittle-endian -mlra -mpic-data-is-text-relative -munaligned-access
@ -mvectorize-with-neon-quad

	.text
.Ltext0:
	.align	2
	.global	foo
	.type	foo, %function
foo:
.LFB1:
	.file 1 "kernel/bounds.c"
	.loc 1 15 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp	@,
.LCFI0:
	stmfd	sp!, {fp, ip, lr, pc}	@,
.LCFI1:
	sub	fp, ip, #4	@,,
.LCFI2:
	.loc 1 17 0
@ 17 "kernel/bounds.c" 1
	
->NR_PAGEFLAGS #22 __NR_PAGEFLAGS	@
@ 0 "" 2
	.loc 1 18 0
@ 18 "kernel/bounds.c" 1
	
->MAX_NR_ZONES #3 __MAX_NR_ZONES	@
@ 0 "" 2
	.loc 1 19 0
@ 19 "kernel/bounds.c" 1
	
->NR_PCG_FLAGS #3 __NR_PCG_FLAGS	@
@ 0 "" 2
	ldmfd	sp, {fp, sp, pc}	@
.LFE1:
	.size	foo, .-foo
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xd
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x8b
	.uleb128 0x4
	.byte	0x8d
	.uleb128 0x3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xc
	.uleb128 0xb
	.uleb128 0x4
	.align	2
.LEFDE0:
	.text
.Letext0:
	.file 2 "include/linux/page-flags.h"
	.file 3 "include/linux/mmzone.h"
	.file 4 "include/linux/page_cgroup.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x189
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x1
	.4byte	.LASF51
	.4byte	.LASF52
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x4
	.byte	0x2
	.byte	0x49
	.4byte	0x135
	.uleb128 0x5
	.4byte	.LASF12
	.sleb128 0
	.uleb128 0x5
	.4byte	.LASF13
	.sleb128 1
	.uleb128 0x5
	.4byte	.LASF14
	.sleb128 2
	.uleb128 0x5
	.4byte	.LASF15
	.sleb128 3
	.uleb128 0x5
	.4byte	.LASF16
	.sleb128 4
	.uleb128 0x5
	.4byte	.LASF17
	.sleb128 5
	.uleb128 0x5
	.4byte	.LASF18
	.sleb128 6
	.uleb128 0x5
	.4byte	.LASF19
	.sleb128 7
	.uleb128 0x5
	.4byte	.LASF20
	.sleb128 8
	.uleb128 0x5
	.4byte	.LASF21
	.sleb128 9
	.uleb128 0x5
	.4byte	.LASF22
	.sleb128 10
	.uleb128 0x5
	.4byte	.LASF23
	.sleb128 11
	.uleb128 0x5
	.4byte	.LASF24
	.sleb128 12
	.uleb128 0x5
	.4byte	.LASF25
	.sleb128 13
	.uleb128 0x5
	.4byte	.LASF26
	.sleb128 14
	.uleb128 0x5
	.4byte	.LASF27
	.sleb128 15
	.uleb128 0x5
	.4byte	.LASF28
	.sleb128 16
	.uleb128 0x5
	.4byte	.LASF29
	.sleb128 17
	.uleb128 0x5
	.4byte	.LASF30
	.sleb128 18
	.uleb128 0x5
	.4byte	.LASF31
	.sleb128 19
	.uleb128 0x5
	.4byte	.LASF32
	.sleb128 20
	.uleb128 0x5
	.4byte	.LASF33
	.sleb128 21
	.uleb128 0x5
	.4byte	.LASF34
	.sleb128 22
	.uleb128 0x5
	.4byte	.LASF35
	.sleb128 8
	.uleb128 0x5
	.4byte	.LASF36
	.sleb128 12
	.uleb128 0x5
	.4byte	.LASF37
	.sleb128 8
	.uleb128 0x5
	.4byte	.LASF38
	.sleb128 4
	.uleb128 0x5
	.4byte	.LASF39
	.sleb128 11
	.byte	0
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x4
	.byte	0x3
	.byte	0xdb
	.4byte	0x15a
	.uleb128 0x5
	.4byte	.LASF42
	.sleb128 0
	.uleb128 0x5
	.4byte	.LASF43
	.sleb128 1
	.uleb128 0x5
	.4byte	.LASF44
	.sleb128 2
	.uleb128 0x5
	.4byte	.LASF45
	.sleb128 3
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.4byte	0x17b
	.uleb128 0x5
	.4byte	.LASF46
	.sleb128 0
	.uleb128 0x5
	.4byte	.LASF47
	.sleb128 1
	.uleb128 0x5
	.4byte	.LASF48
	.sleb128 2
	.uleb128 0x5
	.4byte	.LASF49
	.sleb128 3
	.byte	0
	.uleb128 0x7
	.ascii	"foo\000"
	.byte	0x1
	.byte	0xe
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF48:
	.ascii	"PCG_MIGRATION\000"
.LASF26:
	.ascii	"PG_head\000"
.LASF22:
	.ascii	"PG_reserved\000"
.LASF42:
	.ascii	"ZONE_NORMAL\000"
.LASF29:
	.ascii	"PG_mappedtodisk\000"
.LASF12:
	.ascii	"PG_locked\000"
.LASF16:
	.ascii	"PG_dirty\000"
.LASF25:
	.ascii	"PG_writeback\000"
.LASF23:
	.ascii	"PG_private\000"
.LASF34:
	.ascii	"__NR_PAGEFLAGS\000"
.LASF45:
	.ascii	"__MAX_NR_ZONES\000"
.LASF36:
	.ascii	"PG_fscache\000"
.LASF14:
	.ascii	"PG_referenced\000"
.LASF28:
	.ascii	"PG_swapcache\000"
.LASF41:
	.ascii	"zone_type\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF31:
	.ascii	"PG_swapbacked\000"
.LASF35:
	.ascii	"PG_checked\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF51:
	.ascii	"kernel/bounds.c\000"
.LASF27:
	.ascii	"PG_tail\000"
.LASF40:
	.ascii	"pageflags\000"
.LASF46:
	.ascii	"PCG_LOCK\000"
.LASF43:
	.ascii	"ZONE_HIGHMEM\000"
.LASF52:
	.ascii	"/S860_ROW_OpenSource/sys/kernel\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"PG_error\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF37:
	.ascii	"PG_pinned\000"
.LASF19:
	.ascii	"PG_slab\000"
.LASF20:
	.ascii	"PG_owner_priv_1\000"
.LASF18:
	.ascii	"PG_active\000"
.LASF8:
	.ascii	"sizetype\000"
.LASF24:
	.ascii	"PG_private_2\000"
.LASF5:
	.ascii	"long long int\000"
.LASF17:
	.ascii	"PG_lru\000"
.LASF9:
	.ascii	"char\000"
.LASF32:
	.ascii	"PG_unevictable\000"
.LASF38:
	.ascii	"PG_savepinned\000"
.LASF2:
	.ascii	"short int\000"
.LASF47:
	.ascii	"PCG_USED\000"
.LASF21:
	.ascii	"PG_arch_1\000"
.LASF50:
	.ascii	"GNU C 4.9.4 20150629 (prerelease) -mlittle-endian -"
	.ascii	"marm -mapcs -mno-sched-prolog -mabi=aapcs-linux -mn"
	.ascii	"o-thumb-interwork -march=armv7-a -mfloat-abi=soft -"
	.ascii	"mfpu=neon -g -O2 -fno-strict-aliasing -fno-common -"
	.ascii	"fno-delete-null-pointer-checks -fno-pic -fno-dwarf2"
	.ascii	"-cfi-asm -fstack-protector -fno-omit-frame-pointer "
	.ascii	"-fno-optimize-sibling-calls -fno-strict-overflow -f"
	.ascii	"conserve-stack\000"
.LASF10:
	.ascii	"long int\000"
.LASF44:
	.ascii	"ZONE_MOVABLE\000"
.LASF15:
	.ascii	"PG_uptodate\000"
.LASF49:
	.ascii	"__NR_PCG_FLAGS\000"
.LASF0:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"PG_reclaim\000"
.LASF11:
	.ascii	"_Bool\000"
.LASF33:
	.ascii	"PG_mlocked\000"
.LASF39:
	.ascii	"PG_slob_free\000"
	.ident	"GCC: (Linaro GCC 4.9-2015.06) 4.9.4 20150629 (prerelease)"
