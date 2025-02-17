#!/bin/bash
# Setup script for hsdatalog under Linux
# NOTE: unplug the board before running the script
echo "NOTE: unplug the board before running the script"

if [[ "$(uname -m)" == "armv7l" ]]; then
	sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi/libhs_datalog_v1.so /usr/lib
	sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi/libhs_datalog_v2.so /usr/lib
elif [[ "$(uname -m)" == "aarch64" ]]; then
	if [[ "$(getconf LONG_BIT)" == "32" ]]; then
		sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_32bit/libhs_datalog_v1.so /usr/lib
		sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_32bit/libhs_datalog_v2.so /usr/lib
	else
		sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_64bit/libhs_datalog_v1.so /usr/lib
		sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_64bit/libhs_datalog_v2.so /usr/lib
	fi
else
	sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/linux/libhs_datalog_v1.so /usr/lib
	sudo cp ../stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/linux/libhs_datalog_v2.so /usr/lib
fi

sudo cp 30-hsdatalog.rules /etc/udev/rules.d

# Check if the group already exists
if grep -q "hsdatalog" /etc/group
then
	echo "hsdatalog group exists"
else
	#create hsdatalog group
	echo "Adding hsdatalog group"
	sudo addgroup hsdatalog
	echo "Adding user to hsdatalog group"
	sudo usermod -aG hsdatalog $USER
fi

# Then restart udev
echo "Reloading udev rules"
sudo udevadm control --reload


