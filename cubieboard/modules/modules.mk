ifeq ($(TARGET_KERNEL_CONFIG),)
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules,system/lib/modules)
endif
