#!/usr/bin/env bash
# https://github.com/nathanchance/android-kernel-clang
# https://source.android.google.cn/setup/build/building-kernels
# https://android.googlesource.com/kernel/manifest/+/refs/heads/q-goldfish-android-goldfish-4.14-dev/default.xml
# https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+/refs/heads/master-kernel-build-2021
# https://android.googlesource.com/kernel/goldfish/+/refs/heads/android-goldfish-4.14-dev
# // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
# /* Copyright (c) 2023 fei_cong(https://github.com/feicong/ebpf-course) */
set -e

sudo apt-get update && sudo apt-get install dwarves dialog file python3 python libelf-dev gpg gpg-agent tree flex bison libssl-dev zip unzip curl wget tree build-essential bc software-properties-common libstdc++6 libpulse0 libglu1-mesa locales lcov libsqlite3-0 --no-install-recommends -y
sudo apt-get install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
 # for emulators
sudo apt-get install -y libxtst6 libnss3-dev libnspr4 libxss1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libgdk-pixbuf2.0-0 -y

sudo locale-gen en_US.UTF-8
export LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US:en

mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo

mkdir -p android-kernel && pushd android-kernel
repo init -u https://android.googlesource.com/kernel/manifest -b android-13.0.0_r43
echo Syncing code.
repo sync -cj8

cd aosp

echo Building code.
source build/envsetup.sh
lunch aosp_raven-userdebug
make -j8

echo compile done.
