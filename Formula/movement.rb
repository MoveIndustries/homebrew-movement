class Movement < Formula
  desc "CLI for interacting with the Movement blockchain"
  homepage "https://movementnetwork.xyz/"
  license "Apache-2.0"
  version "7.4.0"

  on_macos do
    on_arm do
      url "https://github.com/movement-network/aptos-core/releases/download/movement-cli-v#{version}/movement-cli-#{version}-macOS-arm64.zip"
      sha256 "4aa311afe756b0be6f5b48dc12d4f76785675075331ec223c0a1bf58e503a86e"
    end
    on_intel do
      url "https://github.com/movement-network/aptos-core/releases/download/movement-cli-v#{version}/movement-cli-#{version}-macOS-x86_64.zip"
      sha256 "46880c5b3a1ca14ca484ebf7f8b247f6603634af74ead3370fcaf29d96e18b9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/movement-network/aptos-core/releases/download/movement-cli-v#{version}/movement-cli-#{version}-Linux-x86_64.zip"
      sha256 "61c717e4a7f542a3c88d14fe8e63cea8bbfea8cb7567d85037be64e941d85472"
    end
  end

  def install
    bin.install "movement"
  end

  test do
    assert_match "movement", shell_output("#{bin}/movement --version")
  end
end
