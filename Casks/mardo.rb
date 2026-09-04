cask "mardo" do
  version "0.9.13"
  sha256 "722fca0967a4953745da0cb860c7f4b988c01ed331f55fa89ecb3551fe205a8b"

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
  binary "Mardo.app/Contents/Helpers/mardo", target: "mardo"
end
