klipper_folder=~/klipper

#################

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $klipper_folder

make clean KCONFIG_CONFIG=$SCRIPT_DIR/config.rpi
make flash KCONFIG_CONFIG=$SCRIPT_DIR/config.rpi

make clean KCONFIG_CONFIG=config.s1
make KCONFIG_CONFIG=config.s1
