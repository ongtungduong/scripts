#!/bin/bash

# Rescan CPU
echo "-----Rescan CPU-----"
for CPU_DIR in /sys/devices/system/cpu/cpu[0-9]*
do
    CPU=${CPU_DIR##*/}
    echo "Found cpu: '${CPU_DIR}' ..."
    CPU_STATE_FILE="${CPU_DIR}/online"
    if [ -f "${CPU_STATE_FILE}" ]; then
        if grep -qx 1 "${CPU_STATE_FILE}"; then
            echo -e "\t${CPU} already online"
        else
            echo -e "\t${CPU} is new cpu, onlining cpu ..."
            echo 1 > "${CPU_STATE_FILE}"
        fi
    else 
        echo -e "\t${CPU} already configured prior to hot-add"
    fi
done

# Rescan RAM
echo "-----Rescan RAM-----"
for RAM in $(grep line /sys/devices/system/memory/*/state)
do
    echo "Found ram: ${RAM} ..."
    if [[ "${RAM}" == *":offline" ]]; then
        echo "Bringing online"
        echo $RAM | sed "s/:offline$//"|sed "s/^/echo online > /"|source /dev/stdin
    else
        echo "Already online"
    fi
done

# Rescan Disk
echo "-----Rescan Disk-----"
for DEVICE_DIR in $(ls /sys/class/scsi_device/)
do
    echo "Found device: ${DEVICE_DIR}"
    echo "Bringing online"
    echo 1 > /sys/class/scsi_device/$DEVICE_DIR/device/rescan
done
