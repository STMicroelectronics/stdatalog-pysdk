#!/bin/bash
# Setup script for hsdatalog under Linux
# NOTE: unplug the board before running the script
echo "NOTE: unplug the board before running the script"

# Add path detection at the beginning of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STDATALOG_ROOT="$(dirname "$SCRIPT_DIR")"

if [[ "$(uname -m)" == "armv7l" ]]; then
	sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi/libhs_datalog_v1.so" /usr/lib
	sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi/libhs_datalog_v2.so" /usr/lib
elif [[ "$(uname -m)" == "aarch64" ]]; then
	# Download, extract, and install libusb
	wget https://github.com/libusb/libusb/releases/download/v1.0.28/libusb-1.0.28.tar.bz2 || { echo "Failed to download libusb"; exit 1; }
	tar xjf libusb-1.0.28.tar.bz2 || { echo "Failed to extract libusb"; exit 1; }
	cd libusb-1.0.28/ || { echo "Failed to enter libusb directory"; exit 1; }
	sudo apt-get install -y libudev-dev || { echo "Failed to install libudev-dev"; exit 1; }
	./configure || { echo "Failed to configure libusb"; exit 1; }
	sudo make install -j 4 || { echo "Failed to install libusb"; exit 1; }
	sudo ldconfig
	if [[ "$(getconf LONG_BIT)" == "32" ]]; then
		sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_32bit/libhs_datalog_v1.so" /usr/lib
		sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_32bit/libhs_datalog_v2.so" /usr/lib
	else
		sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_64bit/libhs_datalog_v1.so" /usr/lib
		sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/raspberryPi4_64bit/libhs_datalog_v2.so" /usr/lib
	fi
else
	sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/linux/libhs_datalog_v1.so" /usr/lib
	sudo cp "$STDATALOG_ROOT/stdatalog_core/stdatalog_core/HSD_link/communication/libhs_datalog/linux/libhs_datalog_v2.so" /usr/lib
fi

sudo cp "$SCRIPT_DIR/30-hsdatalog.rules" /etc/udev/rules.d

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


