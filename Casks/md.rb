cask "md" do
  version "0.9.10"
  sha256 "5c5637edb89e9e02d5a63589a59cce78e213fe0c964218e826bb91512bfd5a21"

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
