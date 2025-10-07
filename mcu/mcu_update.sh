klipper_folder=~/klipper

#################

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $klipper_folder

make clean KCONFIG_CONFIG=$SCRIPT_DIR/config.rpi
make flash KCONFIG_CONFIG=$SCRIPT_DIR/config.rpi

make clean KCONFIG_CONFIG=$SCRIPT_DIR/config.skr
make KCONFIG_CONFIG=$SCRIPT_DIR/config.skr

/home/pi/katapult/scripts/flashtool.py -d /dev/serial/by-id/usb-katapult_lpc1768_23800012658C48AFAE15345DC52000F5-if00 -f /home/pi/klipper/out/klipper.bin
