#!/bin/bash
# Updates the Homebrew formula with correct SHA256 hashes after a release
# Usage: ./update-formula.sh <version>

set -e

VERSION="${1:?Usage: $0 <version>}"
BASE_URL="https://github.com/movementlabsxyz/aptos-core/releases/download/movement-cli-v${VERSION}"
FORMULA_FILE="Formula/movement.rb"

echo "Updating formula for version ${VERSION}..."

echo "Downloading macOS ARM64..."
curl -sL "${BASE_URL}/movement-cli-${VERSION}-macOS-arm64.zip" -o /tmp/macos-arm64.zip
SHA_MACOS_ARM64=$(shasum -a 256 /tmp/macos-arm64.zip | cut -d' ' -f1)
echo "  SHA256: ${SHA_MACOS_ARM64}"

echo "Downloading macOS x86_64..."
curl -sL "${BASE_URL}/movement-cli-${VERSION}-macOS-x86_64.zip" -o /tmp/macos-x86_64.zip
SHA_MACOS_X86_64=$(shasum -a 256 /tmp/macos-x86_64.zip | cut -d' ' -f1)
echo "  SHA256: ${SHA_MACOS_X86_64}"

echo "Downloading Linux x86_64..."
curl -sL "${BASE_URL}/movement-cli-${VERSION}-Linux-x86_64.zip" -o /tmp/linux-x86_64.zip
SHA_LINUX_X86_64=$(shasum -a 256 /tmp/linux-x86_64.zip | cut -d' ' -f1)
echo "  SHA256: ${SHA_LINUX_X86_64}"

echo "Updating ${FORMULA_FILE}..."

sed -i '' \
  -e "s/version \".*\"/version \"${VERSION}\"/" \
  "${FORMULA_FILE}"

# Update SHA256 for macOS ARM
sed -i '' "/macOS-arm64/,/sha256/{s/sha256 \".*\"/sha256 \"${SHA_MACOS_ARM64}\"/;}" "${FORMULA_FILE}"

# Update SHA256 for macOS x86_64
sed -i '' "/macOS-x86_64/,/sha256/{s/sha256 \".*\"/sha256 \"${SHA_MACOS_X86_64}\"/;}" "${FORMULA_FILE}"

# Update SHA256 for Linux x86_64
sed -i '' "/Linux-x86_64/,/sha256/{s/sha256 \".*\"/sha256 \"${SHA_LINUX_X86_64}\"/;}" "${FORMULA_FILE}"

rm -f /tmp/macos-arm64.zip /tmp/macos-x86_64.zip /tmp/linux-x86_64.zip

echo "Done! Run 'git diff' to review changes."
