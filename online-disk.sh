#!/bin/bash

for DEVICE in $(ls /sys/class/scsi_device/)
do
    echo "Found device: ${DEVICE}"
    echo "Bringing online"
    echo 1 > /sys/class/scsi_device/$DEVICE/device/rescan
done