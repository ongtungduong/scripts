#!/bin/bash

for DEVICE_DIR in $(ls /sys/class/scsi_device/)
do
    echo "Found device: ${DEVICE_DIR}"
    echo "Bringing online"
    echo 1 > /sys/class/scsi_device/$DEVICE_DIR/device/rescan
done
