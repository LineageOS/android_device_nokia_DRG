#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.

function blob_fixup() {
    case "${1}" in
        # Fix missing symbol _ZN7android8hardware7details17gBnConstructorMapE
        vendor/lib64/libvendor.goodix.hardware.fingerprint@1.0.so | vendor/lib64/libvendor.goodix.hardware.fingerprintextension@1.0.so)
            "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            ;;
    esac
}

if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=DRG
export DEVICE_COMMON=sdm660-common
export VENDOR=nokia

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
