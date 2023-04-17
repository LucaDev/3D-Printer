klipper_folder=~/klipper

#################

cd $klipper_folder

make clean KCONFIG_CONFIG=config.s1
make menuconfig KCONFIG_CONFIG=config.s1
make KCONFIG_CONFIG=config.s1

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi