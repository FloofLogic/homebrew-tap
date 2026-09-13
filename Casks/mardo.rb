cask "mardo" do
  version "0.9.21"
  sha256 "850caa258c7d5dd40159ae31df31c679ff88891ef92c5d95167d74253f592f74"

  url "https://github.com/FloofLogic/mardo/releases/download/v#{version}/Mardo.zip"
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
