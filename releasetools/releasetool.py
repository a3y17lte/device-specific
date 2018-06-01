# Copyright (C) 2018 The LineageOS Project
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

'''a3y17lte release tool'''

import common
import re
import os
import sys
import time

LOCAL_DIR = os.path.dirname(os.path.abspath(__file__))
TARGET_DIR = os.getenv('TOP')
OUT_DIR = os.getenv('OUT')
UTILITIES_DIR = os.path.join(TARGET_DIR, 'symbols')
ROM = os.getenv ('TARGET_PRODUCT').split("_",1)

def addFolderToZip(info, directory, basedir):
    list = os.listdir(directory)

    for entity in list:
        each = os.path.join(directory,entity)

        if os.path.isfile(each):
            print "Adding override file -> "+ os.path.join(basedir, entity)
            info.output_zip.write(each, os.path.join(basedir, entity))
        else:
            addFolderToZip(info,each,os.path.join(basedir, entity))

def FullOTA_InstallBegin(info):
    info.script.AppendExtra('ui_print("                                                    ");');
    info.script.AppendExtra('ui_print("                Thanks for installing !             ");');
    info.script.AppendExtra('ui_print("    Source code available on GitHub : @a3y17lte     ");');
    info.script.AppendExtra('ui_print("                                                    ");');
    info.script.AppendExtra('ui_print("    --> Maintainer:                                 ");');
    info.script.AppendExtra('ui_print("                    __  __    ___                   ");');
    info.script.AppendExtra('ui_print("                   |  \/  |__| __|  _               ");');
    info.script.AppendExtra('ui_print("                   | |\/| / _| _| || |              ");');
    info.script.AppendExtra('ui_print("                   |_|  |_\__|_| \_, |              ");');
    info.script.AppendExtra('ui_print("                                 |__/               ");');
    info.script.AppendExtra('ui_print("                                                    ");');
    info.script.AppendExtra('ui_print("    --> Device: Samsung Galaxy A3 2017              ");');
    info.script.AppendExtra('ui_print("                                                    ");');
    info.script.AppendExtra('ui_print("                                                    ");');

def FullOTA_InstallEnd(info):
     # run installend scripts
     info.script.AppendExtra('mount("ext4", "EMMC", "/dev/block/platform/13540000.dwmmc0/by-name/SYSTEM", "/system", "");')
     info.script.AppendExtra('assert(run_program("/tmp/install/bin/nfc_scripts.sh", "installend") == 0);')
     info.script.AppendExtra('unmount("/system");')
