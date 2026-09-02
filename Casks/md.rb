cask "md" do
  version "0.9.11"
  sha256 "c4f9999aa06b0b52d32e308d50043b3f276f956cbc2d0e3d54d0d3799b586b03"

  url "https://mardo.flooflogic.com/releases/Mardo-#{version}.zip"
  name "Mardo"
  desc "Native file-first Markdown viewer and editor"
  homepage "https://mardo.app/"

  livecheck do
    url "https://downloads.flooflogic.com/mardo/release.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Mardo.app"
  binary "Mardo.app/Contents/Helpers/md", target: "md"
end
