class Floofclaw < Formula
  desc "Tiny C runtime for durable AI agents"
  homepage "https://floofclaw.com/"
  url "https://github.com/FloofLogic/Floofclaw/releases/download/v0.30.0/floofclaw-v0.30.0-darwin-arm64.tar.gz"
  sha256 "d4baf4ae452778e4f6e30b4902c8e35910d290a51f1cc03d5a2a32c6861734e9"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bin/fclaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fclaw --version -h")
  end
end
