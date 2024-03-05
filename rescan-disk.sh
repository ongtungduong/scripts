#!/bin/bash

for device in $(ls /sys/class/scsi_device/)
do
    echo "Found device: ${device}"
    echo "Bringing online"
    echo 1 > /sys/class/scsi_device/$device/device/rescan
done
