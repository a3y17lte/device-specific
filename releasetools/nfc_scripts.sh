#!/sbin/sh
#
# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011-2013, The Linux Foundation. All rights reserved.
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

systemp=$(cat tmp/recovery.log | grep "/system |" | cut -d "|" -f 2)
mount $systemp /system

getprop=`getprop ro.bootloader`
variant=`echo $getprop | cut -c1-6`
if [ $variant = "A320FL" ]
then
    rm /system/etc/libnfc-sec-hal.conf.s3nrn81 /system/etc/nfc/sec_s3nrn81_rfreg.bin /system/vendor/firmware/nfc/sec_s3nrn81_firmware.bin
else
    rm /system/etc/libnfc-sec-hal.conf /system/etc/sec_s3nrn80_rfreg.bin /system/vendor/firmware/sec_s3nrn80_firmware.bin
    mv /system/etc/libnfc-sec-hal.conf.s3nrn81 /system/etc/libnfc-sec-hal.conf
fi
exit 0
