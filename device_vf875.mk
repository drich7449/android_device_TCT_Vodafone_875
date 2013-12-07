$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/vodafone/vf875/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := device/vodafone/vf875/kernel
else
        LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)


# Speed up scrolling
PRODUCT_PROPERTY_OVERRIDES += \
    windowsmgr.max_events_per_sec=60
# Default network type.
# 0 => WCDMA preferred, 3 => GSM/AUTO (PRL) preferred
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r5 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    com.android.future.usb.accessory \

PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

#permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

#root
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/root/fstab:root/fstab \
    device/vodafone/vf875/root/init.mt6575.rc:root/init.mt6575.rc \
    device/vodafone/vf875/root/init.usb.rc:root/init.usb.rc \
    device/vodafone/vf875/root/ueventd.mt6575.rc:root/ueventd.mt6575.rc

#system/etc
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

#system/etc/firmware
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/prebuilt/system/etc/firmware/catcher_filter.bin:system/etc/firmware/catcher_filter.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/DSP_ROM:system/etc/firmware/DSP_ROM \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_rom.bin:system/etc/firmware/mt6628_fm_rom.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v1_coeff.bin:system/etc/firmware/mt6628_fm_v1_coeff.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v1_patch.bin:system/etc/firmware/mt6628_fm_v1_patch.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v2_coeff.bin:system/etc/firmware/mt6628_fm_v2_coeff.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v2_patch.bin:system/etc/firmware/mt6628_fm_v2_patch.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v3_coeff.bin:system/etc/firmware/mt6628_fm_v3_coeff.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v3_patch.bin:system/etc/firmware/mt6628_fm_v3_patch.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v4_coeff.bin:system/etc/firmware/mt6628_fm_v4_coeff.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v4_patch.bin:system/etc/firmware/mt6628_fm_v4_patch.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v5_coeff.bin:system/etc/firmware/mt6628_fm_v5_coeff.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_fm_v5_patch.bin:system/etc/firmware/mt6628_fm_v5_patch.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_patch_e1_hdr.bin:system/etc/firmware/mt6628_patch_e1_hdr.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/mt6628_patch_e2_hdr.bin:system/etc/firmware/mt6628_patch_e2_hdr.bin \
    device/vodafone/vf875/prebuilt/system/etc/firmware/S_ANDRO_SFL.ini:system/etc/firmware/S_ANDRO_SFL.ini \
    device/vodafone/vf875/prebuilt/system/etc/firmware/WIFI_RAM_CODE:system/etc/firmware/WIFI_RAM_CODE \
    device/vodafone/vf875/prebuilt/system/etc/firmware/WIFI_RAM_CODE_E6:system/etc/firmware/WIFI_RAM_CODE_E6 \
    device/vodafone/vf875/prebuilt/system/etc/firmware/WIFI_RAM_CODE_MT6628:system/etc/firmware/WIFI_RAM_CODE_MT6628 \
    device/vodafone/vf875/prebuilt/system/etc/firmware/WMT.cfg:system/etc/firmware/WMT.cfg

#system/etc/mddb
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/prebuilt/system/etc/mddb/BPLGUInfoCustomAppSrcP_MT6575_S01_MAUI_11AMDW1222SP_V15_F5_P11_T5:system/etc/mddb/BPLGUInfoCustomAppSrcP_MT6575_S01_MAUI_11AMDW1222SP_V15_F5_P11_T5

#system/etc/wifi
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/prebuilt/system/etc/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
    device/vodafone/vf875/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

#system/lib/egl
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/prebuilt/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg

#system/lib
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/prebuilt/system/lib/mtk-ril.so:system/lib/mtk-ril.so

#system/lib/modules
PRODUCT_COPY_FILES += \
    device/vodafone/vf875/prebuilt/system/lib/modules/ccci.ko:system/lib/modules/ccci.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/ccci_plat.ko:system/lib/modules/ccci_plat.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/ccmni.ko:system/lib/modules/ccmni.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/devapc.ko:system/lib/modules/devapc.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/devinfo.ko:system/lib/modules/devinfo.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/eeprom_93cx6.ko:system/lib/modules/eeprom_93cx6.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/hid-logitech-dj.ko:system/lib/modules/hid-logitech-dj.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/m4u.ko:system/lib/modules/m4u.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtklfb.ko:system/lib/modules/mtklfb.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_fm_drv.ko:system/lib/modules/mtk_fm_drv.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_fm_priv.ko:system/lib/modules/mtk_fm_priv.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_hif_sdio.ko:system/lib/modules/mtk_hif_sdio.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_hif_sdio_mt6620.ko:system/lib/modules/mtk_hif_sdio_mt6620.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_bt.ko:system/lib/modules/mtk_stp_bt.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_bt_mt6620.ko:system/lib/modules/mtk_stp_bt_mt6620.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_gps.ko:system/lib/modules/mtk_stp_gps.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_gps_mt6620.ko:system/lib/modules/mtk_stp_gps_mt6620.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_uart.ko:system/lib/modules/mtk_stp_uart.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_uart_mt6620.ko:system/lib/modules/mtk_stp_uart_mt6620.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_wmt.ko:system/lib/modules/mtk_stp_wmt.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_stp_wmt_mt6620.ko:system/lib/modules/mtk_stp_wmt_mt6620.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_wmt_wifi.ko:system/lib/modules/mtk_wmt_wifi.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/mtk_wmt_wifi_mt6620.ko:system/lib/modules/mtk_wmt_wifi_mt6620.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/pvrsrvkm.ko:system/lib/modules/pvrsrvkm.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/scsi_tgt.ko:system/lib/modules/scsi_tgt.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/sec.ko:system/lib/modules/sec.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/vcodec_kernel_driver.ko:system/lib/modules/vcodec_kernel_driver.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/wlan.ko:system/lib/modules/wlan.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/wlan_mt6620.ko:system/lib/modules/wlan_mt6620.ko \
    device/vodafone/vf875/prebuilt/system/lib/modules/wlan_mt6628.ko:system/lib/modules/wlan_mt6628.ko \

PRODUCT_DEVICE := vf875
PRODUCT_NAME := full_vf875
PRODUCT_BRAND := vodafone
PRODUCT_MODEL := vf875
PRODUCT_MANUFACTURER := vodafone
PRODUCT_RELEASE_NAME := vf875