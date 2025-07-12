#!/bin/bash
# Script to download files and calculate SHA256 for winget manifest

echo "Downloading hello-cli v0.1.0 binaries and calculating SHA256..."

# AMD64
echo "Downloading AMD64 binary..."
curl -L -o hello_amd64.exe https://github.com/dongzhenye/hello-cli/releases/download/v0.1.0/hello_0.1.0_windows_amd64.exe
SHA256_AMD64=$(sha256sum hello_amd64.exe | cut -d' ' -f1)
echo "AMD64 SHA256: $SHA256_AMD64"

# ARM64
echo "Downloading ARM64 binary..."
curl -L -o hello_arm64.exe https://github.com/dongzhenye/hello-cli/releases/download/v0.1.0/hello_0.1.0_windows_arm64.exe
SHA256_ARM64=$(sha256sum hello_arm64.exe | cut -d' ' -f1)
echo "ARM64 SHA256: $SHA256_ARM64"

# Update the installer.yaml file
INSTALLER_FILE="manifests/d/dongzhenye/hello-cli/0.1.0/dongzhenye.hello-cli.installer.yaml"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/PLACEHOLDER_SHA256_AMD64/$SHA256_AMD64/g" "$INSTALLER_FILE"
    sed -i '' "s/PLACEHOLDER_SHA256_ARM64/$SHA256_ARM64/g" "$INSTALLER_FILE"
else
    # Linux
    sed -i "s/PLACEHOLDER_SHA256_AMD64/$SHA256_AMD64/g" "$INSTALLER_FILE"
    sed -i "s/PLACEHOLDER_SHA256_ARM64/$SHA256_ARM64/g" "$INSTALLER_FILE"
fi

echo "SHA256 values updated in $INSTALLER_FILE"

# Cleanup
rm -f hello_amd64.exe hello_arm64.exe

echo "Done!"