#
# Copyright (C) 2020 The LineageOS Project
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

# Vendor blobs
$(call inherit-product, vendor/nokia/DRG/DRG-vendor.mk)

# Set Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 27

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    AvoidAppsInCutoutOverlay \
    NoCutoutOverlay

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot Animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# FM
PRODUCT_PACKAGES += \
    FM2

$(call soong_config_set_bool,libfmjni,no_fm_firmware,true)

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-hmd
WITH_GMS_COMMS_SUITE := false

# Init
PRODUCT_PACKAGES += \
    init.DRG.target.rc

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Inherit from nokia sdm660-common
$(call inherit-product, device/nokia/sdm660-common/common.mk)
