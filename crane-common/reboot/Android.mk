LOCAL_PATH := $(call my-dir)

# Note: add this to the BoardConfig.mk
# TARGET_RECOVERY_PRE_COMMAND := "setrecovery"

include $(CLEAR_VARS)
LOCAL_SRC_FILES := setrecovery.c
LOCAL_MODULE := setrecovery
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := setrecovery.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := static_setrecovery
LOCAL_MODULE_STEM := setrecovery
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_STATIC_LIBRARIES := libc
include $(BUILD_EXECUTABLE)
