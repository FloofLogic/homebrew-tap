cask "md" do
  version "0.9.12"
  sha256 "133106fa08e1316419729178dab063329680027f2719c6e90e76e6cae2508bb5"

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
