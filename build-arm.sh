echo "#################"
echo "Init build-arm.sh"
echo "#################"
echo ""
echo "Processor: $(uname -m)"
echo "OS: $(uname -o)"
echo "Kernel: $(uname -r)"
echo "Date: $(date)"

# Verify that the system is running on ARM
if [ "$(uname -m)" != "armv7l" ]; then
    echo "This script is intended to run on ARM architecture only."
    exit 1
fi