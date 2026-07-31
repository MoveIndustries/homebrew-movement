# Homebrew Movement

Homebrew tap for the [Movement CLI](https://docs.movementnetwork.xyz/devs/movementcli) - a command-line tool for interacting with the Movement blockchain.

## Installation

```bash
brew tap MoveIndustries/movement
brew install movement
```

## Upgrade

```bash
brew upgrade movement
```

## Supported Platforms

- macOS (Apple Silicon / ARM64)
- macOS (Intel / x86_64)
- Linux (x86_64)

## Updating the Formula After a Release

After running the [Release CLI workflow](https://github.com/movement-network/aptos-core/actions) to publish a new version, you need to update this tap with the new version and SHA256 checksums.

### What the update script does

The `update-formula.sh` script automates the entire process:

1. Downloads the release binaries from GitHub for all platforms:
   - `movement-cli-<version>-macOS-arm64.zip`
   - `movement-cli-<version>-macOS-x86_64.zip`
   - `movement-cli-<version>-Linux-x86_64.zip`

2. Calculates the SHA256 checksum for each binary

3. Updates `Formula/movement.rb` with:
   - The new version number
   - The new SHA256 checksums for each platform

### Steps to update

1. Clone this repo (if you haven't already):
   ```bash
   git clone https://github.com/MoveIndustries/homebrew-movement.git
   cd homebrew-movement
   ```

2. Run the update script with the new version number (must match the release tag):
   ```bash
   ./update-formula.sh <version>
   ```

   Example:
   ```bash
   ./update-formula.sh 7.5.0
   ```

   You'll see output like:
   ```
   Updating formula for version 7.5.0...
   Downloading macOS ARM64...
     SHA256: abc123...
   Downloading macOS x86_64...
     SHA256: def456...
   Downloading Linux x86_64...
     SHA256: ghi789...
   Updating Formula/movement.rb...
   Done! Run 'git diff' to review changes.
   ```

3. Review the changes:
   ```bash
   git diff
   ```

4. Commit and push:
   ```bash
   git add Formula/movement.rb
   git commit -m "Update movement to <version>"
   git push
   ```

Users can then run `brew upgrade movement` to get the new version.
