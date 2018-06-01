# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
WIFI_DRIVER_MODULE_NAME          := wlan
WIFI_DRIVER_MODULE_PATH          := /modules/qca_cld/qca_cld_wlan.ko
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WPA_SUPPLICANT_USE_HIDL          := true


# Wifi loader
BOARD_HAVE_SAMSUNG_WIFI := true
