# Inherit some common Lineage stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Device
$(call inherit-product, device/nokia/DRG/device.mk)

BUILD_FINGERPRINT := Nokia/Dragon_00WW/DRG_sprout:10/QKQ1.190828.002/00WW_4_150:user/release-keys
PRODUCT_BRAND := Nokia
PRODUCT_DEVICE := DRG
PRODUCT_MANUFACTURER := HMD Global
PRODUCT_MODEL := Nokia 6.1 Plus
PRODUCT_NAME := lineage_DRG

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=DRG_sprout \
    PRODUCT_NAME=Dragon_00WW \
    PRIVATE_BUILD_DESC="Dragon_00WW 10 QKQ1.190828.002 00WW_4_150 release-keys"
