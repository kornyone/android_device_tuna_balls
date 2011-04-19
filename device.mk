#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/tuna/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/samsung/tuna/overlay

# PRODUCT_PACKAGES := \
#	liblights.tuna

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/samsung/tuna/init.tuna.rc:root/init.tuna.rc \
	device/samsung/tuna/ueventd.tuna.rc:root/ueventd.tuna.rc \
	device/samsung/tuna/media_profiles.xml:system/etc/media_profiles.xml

# HACK: copy panda init for now to boot on both boards
PRODUCT_COPY_FILES += \
	device/ti/panda/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)
$(call inherit-product-if-exists, vendor/samsung/tuna/device-vendor.mk)