#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Required!
export DEVICE=DRG
export DEVICE_COMMON=sdm660-common
export VENDOR=nokia

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
