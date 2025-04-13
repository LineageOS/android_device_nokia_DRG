#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

import extract_utils.tools
extract_utils.tools.DEFAULT_PATCHELF_VERSION = '0_9'

namespace_imports = [
    'device/nokia/sdm660-common',
    'hardware/qcom-caf/msm8998',
    'hardware/qcom-caf/wlan',
    'vendor/nokia/sdm660-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib/hw/camera.sdm660.so': blob_fixup()
	.remove_needed('libMegviiFacepp.so')
	.remove_needed('libmegface-new.so')
	.add_needed('libshim_megvii.so'),
    ('vendor/lib64/libvendor.goodix.hardware.fingerprint@1.0.so', 'vendor/lib64/libvendor.goodix.hardware.fingerprintextension@1.0.so'): blob_fixup()
        .remove_needed('libhidltransport.so')
        .replace_needed('libhidlbase.so', 'libhidlbase-v32.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'DRG',
    'nokia',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sdm660-common', module.vendor
    )
    utils.run()
