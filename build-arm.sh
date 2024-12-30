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

# Debugging
ls

# Build the package
title "Building the package..."
cd pve-common
make deb

# Debugging
ls
