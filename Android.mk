#
# This Makefile will build tslib with most of the plugins
# and all the test applications
#

LOCAL_PATH:= $(call my-dir)
LOCAL_MODULE_TAGS := optional

include $(CLEAR_VARS)

TSLIB_PLUGINDIR := /system/lib/ts/plugins

LOCAL_SRC_FILES := \
        src/ts_attach.c \
        src/ts_close.c \
        src/ts_config.c \
        src/ts_error.c \
        src/ts_fd.c \
        src/ts_load_module.c \
        src/ts_open.c \
        src/ts_option.c \
        src/ts_parse_vars.c \
        src/ts_read.c \
        src/ts_read_raw.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/
LOCAL_CFLAGS := -DTS_CONF=\"/system/etc/ts.conf\"
LOCAL_CFLAGS += -DPLUGIN_DIR=\"/system/lib/ts/plugins\"

LOCAL_SHARED_LIBRARIES := libdl

LOCAL_MODULE := libts
LOCAL_MODULE_TAGS := optional

LOCAL_PRELINK_MODULE := false 

include $(BUILD_SHARED_LIBRARY)

#
# plugin: input-raw
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES := plugins/input-raw.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts/plugins/input
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

#
# plugin: pthres
#
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false 

LOCAL_SRC_FILES := plugins/pthres.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts/plugins/pthres
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

#
# plugin: linear
#
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false 

LOCAL_SRC_FILES := plugins/linear.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/
LOCAL_CFLAGS += -DTS_POINTERCAL=\"/system/etc/pointercal\"

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts/plugins/linear
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

#
# plugin: dejitter
#
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false 

LOCAL_SRC_FILES := plugins/dejitter.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts/plugins/dejitter
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

#
# plugin: variance
#
include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false 

LOCAL_SRC_FILES := plugins/variance.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts/plugins/variance
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

#
# ts_calibrate
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES :=  tests/testutils.c \
        tests/fbutils.c \
        tests/font_8x8.c \
        tests/ts_calibrate.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/
LOCAL_CFLAGS := -DTS_POINTERCAL=\"/system/etc/pointercal\"

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts_calibrate
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

#
# ts_test
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES :=  tests/testutils.c \
        tests/fbutils.c \
        tests/font_8x8.c \
        tests/ts_test.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts_test
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

#
# ts_print
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES :=  tests/testutils.c \
        tests/fbutils.c \
        tests/font_8x8.c \
        tests/ts_print.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts_print
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

#
# ts_print_raw
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES :=  tests/testutils.c \
        tests/fbutils.c \
        tests/font_8x8.c \
        tests/ts_print_raw.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts_print_raw
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

#
# ts_harvest
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES :=  tests/testutils.c \
        tests/fbutils.c \
        tests/font_8x8.c \
        tests/ts_harvest.c

LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/

LOCAL_SHARED_LIBRARIES := libdl \
                        libts

LOCAL_MODULE := ts_harvest
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
