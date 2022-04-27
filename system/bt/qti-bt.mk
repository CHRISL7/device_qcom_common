# Copyright (C) 2022 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Include QTI Bluetooth makefiles.
ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS),true)
ifneq ($(TARGET_USE_QTI_BT_STACK),false)
include vendor/qcom/opensource/commonsys-intf/bluetooth/bt-commonsys-intf-board.mk
$(call inherit-product, vendor/qcom/opensource/commonsys-intf/bluetooth/bt-system-opensource-product.mk)
endif
endif

# Properties
ifneq ($(TARGET_USE_QTI_BT_STACK),false)
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    ro.bluetooth.library_name=libbluetooth_qti.so
endif

# Hearing Aid Audio Support Using Bluetooth LE
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.asha.central.enabled?=true \
    bluetooth.profile.a2dp.source.enabled?=true \
    bluetooth.profile.avrcp.target.enabled?=true \
    bluetooth.profile.bap.broadcast.assist.enabled?=true \
    bluetooth.profile.bap.unicast.client.enabled?=true \
    bluetooth.profile.bas.client.enabled?=true \
    bluetooth.profile.csip.set_coordinator.enabled?=true \
    bluetooth.profile.gatt.enabled?=true \
    bluetooth.profile.hap.client.enabled?=true \
    bluetooth.profile.hfp.ag.enabled?=true \
    bluetooth.profile.hid.device.enabled?=true \
    bluetooth.profile.hid.host.enabled?=true \
    bluetooth.profile.map.server.enabled?=true \
    bluetooth.profile.mcp.server.enabled?=true \
    bluetooth.profile.opp.enabled?=true \
    bluetooth.profile.pan.nap.enabled?=true \
    bluetooth.profile.pan.panu.enabled?=true \
    bluetooth.profile.pbap.server.enabled?=true \
    bluetooth.profile.sap.server.enabled?=true \
    bluetooth.profile.ccp.server.enabled?=true \
    bluetooth.profile.vcp.controller.enabled?=true

# Get non-open-source specific aspects.
$(call inherit-product-if-exists, vendor/qcom/common/system/bt/bt-vendor.mk)
