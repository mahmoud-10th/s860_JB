# Copyright (C) 2008 The Android Open Source Project
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
               
ifeq ($(HAVE_AEE_FEATURE),yes)

LOCAL_C_INCLUDES += \
	$(MTK_ROOT)/external/aee/binary/inc
LOCAL_CFLAGS += -DHAVE_AEE_FEATURE
LOCAL_SHARED_LIBRARIES += libaed

ifeq ($(MTK_MEMORY_COMPRESSION_SUPPORT), yes)
LOCAL_CFLAGS += -DMTK_MEMORY_COMPRESSION_SUPPORT
endif                

ifeq ($(MTK_USE_RESERVED_EXT_MEM), yes)
#LOCAL_CFLAGS += -DMTK_USE_RESERVED_EXT_MEM
endif                
               
LOCAL_SRC_FILES := autosanity.c
LOCAL_SHARED_LIBRARIES += libcutils libutils
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := autosanity

include $(BUILD_EXECUTABLE)
endif
