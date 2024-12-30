echo "#################"
echo "Init build-arm.sh"
echo "#################"
echo
echo "Processor: $(uname -m)"
echo "OS: $(uname -o)"
echo "Kernel: $(uname -r)"
echo "Date: $(date)"
echo
echo

# Function title
function title {
    echo
    echo "#################"
    echo "# $1"
    echo "#################"
    echo
}

# Verify that the system is running on ARM
if [ "$(uname -m)" != "aarch64" ]; then
    echo "This script is intended to run on ARM architecture only."
    exit 1
fi

# Update the package list
title "Update the package list"
apt-get update

# Install devscripts
title "Installing devscripts..."
apt-get install -y devscripts

# cd into the pve-common directory
title "cd into the pve-common directory..."
cd pve-common

# Install the required packages
title "Installing the required packages..."
yes|mk-build-deps --install

# Debugging
ls

# Build the package
title "Building the package..."
make deb

# Debugging
ls
