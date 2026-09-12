cask "mardo" do
  version "0.9.20"
  sha256 "bbcb0c4dda53640a7769ff98b83293af7497f529f6e1b2de4dff41f680680986"

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
