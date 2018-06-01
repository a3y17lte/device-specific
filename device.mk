#00000
# Copyright (C) 2017 The LineageOS Project
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

LOCAL_PATH := device/samsung/a3y17lte

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
#TARGET_COPY_OUT += /system/vendor

# Manifest
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/manifest/manifest.xml:system/vendor/manifest.xml

# qca_cld_wlan
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/wifi/android.hardware.wifi@1.0-service.rc:system/vendor/etc/init/android.hardware.wifi@1.0-service.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/grippower.info:system/vendor/etc/wlan/grippower.info \
    $(LOCAL_PATH)/configs/wifi/qcom_cfg.ini:system/vendor/etc/wlan/qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/vendor/etc/wlan/WCNSS_cfg.dat

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/grippower.info:system/vendor/firmware/wlan/grippower.info \
    $(LOCAL_PATH)/configs/wifi/qcom_cfg.ini:system/vendor/firmware/wlan/qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/WCNSS_cfg.dat

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/qca_cld_wlan.ko:root/modules/qca_cld/qca_cld_wlan.ko

BUILD_FINGERPRINT := samsung/a3y17ltexx/a3y17lte:8.0.0/R16NW/A320FXXU4CRL1:user/release-keys

# include splitted configs
-include $(LOCAL_PATH)/configs/product/*.mk

# Inherit from Exynos7870-common
$(call inherit-product, device/samsung/exynos7870-common/device-common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/a3y17lte/a3y17lte-vendor.mk)

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call the common proprietary setup
$(call inherit-product, vendor/samsung/exynos7870-common/exynos7870-common-vendor.mk)

