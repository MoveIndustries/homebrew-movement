class Movement < Formula
  desc "CLI for interacting with the Movement blockchain"
  homepage "https://movementnetwork.xyz/"
  license "Apache-2.0"
  version "7.4.0"

  on_macos do
    on_arm do
      url "https://github.com/movementlabsxyz/aptos-core/releases/download/movement-cli-v#{version}/movement-cli-#{version}-macOS-arm64.zip"
      sha256 "PLACEHOLDER_SHA256_MACOS_ARM64"
    end
    on_intel do
      url "https://github.com/movementlabsxyz/aptos-core/releases/download/movement-cli-v#{version}/movement-cli-#{version}-macOS-x86_64.zip"
      sha256 "PLACEHOLDER_SHA256_MACOS_X86_64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/movementlabsxyz/aptos-core/releases/download/movement-cli-v#{version}/movement-cli-#{version}-Linux-x86_64.zip"
      sha256 "PLACEHOLDER_SHA256_LINUX_X86_64"
    end
  end

  def install
    bin.install "movement"
  end

  test do
    assert_match "movement", shell_output("#{bin}/movement --version")
  end
end
