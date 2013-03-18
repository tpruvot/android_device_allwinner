LOCAL_PATH:= $(call my-dir)

sunxi_tools_includes := $(LOCAL_PATH)/include
sunxi_tools_cflags := -std=c99 -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE -D_GNU_SOURCE -Wno-pointer-arith

include $(CLEAR_VARS)
LOCAL_MODULE := bootinfo
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE).c
LOCAL_C_INCLUDES := ${sunxi_tools_includes}
LOCAL_CFLAGS := ${sunxi_tools_cflags}
LOCAL_SHARED_LIBRARIES := libcutils
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := pio
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := pio.c
LOCAL_C_INCLUDES := ${sunxi_tools_includes}
LOCAL_CFLAGS := ${sunxi_tools_cflags}
LOCAL_SHARED_LIBRARIES := libcutils
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := nand-part
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE).c
LOCAL_C_INCLUDES := ${sunxi_tools_includes}
LOCAL_CFLAGS := ${sunxi_tools_cflags}
LOCAL_SHARED_LIBRARIES := libcutils
include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#LOCAL_MODULE := jtag-loop
#LOCAL_MODULE_TAGS := optional
#LOCAL_SRC_FILES := bin/jtag-loop.sunxi
#LOCAL_MODULE_CLASS := UTILITIES
#include $(BUILD_PREBUILT)

###################################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := phoenix_info
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE).c
LOCAL_C_INCLUDES := ${sunxi_tools_includes}
LOCAL_CFLAGS := ${sunxi_tools_cflags}
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := fexc
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := ${sunxi_tools_includes}
LOCAL_CFLAGS := ${sunxi_tools_cflags}
LOCAL_SRC_FILES := fexc.h script.h fexc.c script.c script_fex.c script_uboot.c script_bin.c

FEXC_LINKS := bin2fex fex2bin
FEXC_SYMLINKS := $(addprefix $(HOST_OUT_EXECUTABLES)/,$(notdir $(FEXC_LINKS)))

LOCAL_POST_PROCESS_COMMAND := $(foreach s,$(FEXC_SYMLINKS), \
    @rm -f $(s); ln -sf $(LOCAL_MODULE) $(s) && echo "Symlink: $(s) -> $(LOCAL_MODULE)"; \
)

include $(BUILD_HOST_EXECUTABLE)


include $(CLEAR_VARS)
LIBUSB := libusb-1.0
LOCAL_MODULE := fel
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := fel.c
LOCAL_C_INCLUDES := ${sunxi_tools_includes}
LOCAL_CFLAGS := ${sunxi_tools_cflags} -m64 $(shell pkg-config --cflags libusb-1.0)
LOCAL_LDLIBS := -m64 $(shell pkg-config --libs libusb-1.0)
include $(BUILD_HOST_EXECUTABLE)

