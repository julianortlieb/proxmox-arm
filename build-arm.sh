echo "#################"
echo "Init build-arm.sh"
echo "#################"
echo ""
echo "Processor: $(uname -m)"
echo "OS: $(uname -o)"
echo "Kernel: $(uname -r)"
echo "Date: $(date)"

# Verify that the system is running on ARM
if [ "$(uname -m)" != "aarch64" ]; then
    echo "This script is intended to run on ARM architecture only."
    exit 1
fi

# Update the package list
echo "Updating the package list..."
pt-get update

# Install devscripts
echo "Installing devscripts..."
apt-get install -y devscripts

cd pve-common

# Install the required packages
echo "Installing the required packages..."
yes|mk-build-deps --install

# Build the package
echo "Building the package..."
make deb

# Debugging
ls
