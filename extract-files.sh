#!/bin/sh

VENDOR=huawei
DEVICE=s7

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    /home/mike/dev/android/sdk/android-sdk-linux/platform-tools/adb pull /system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
