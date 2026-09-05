class Floofclaw < Formula
  desc "Tiny C runtime for durable AI agents"
  homepage "https://floofclaw.com/"
  url "https://github.com/FloofLogic/Floofclaw/releases/download/v0.31.0/floofclaw-v0.31.0-darwin-arm64.tar.gz"
  sha256 "55c0fecac91a7d61de24c40605a2ab7b9f8e41508b0aff17a8a3f600539f6353"
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
