cask "mardo" do
  version "1.0.2"
  sha256 "14cfac4837d3c473fb14645c5bee547442e8eedc202f8ebd9bf0caf27ea2df2c"

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

  caveats "Open Mardo once to turn on its Quick Look previews and thumbnails in Finder. " \
          "On that first launch, Mardo asks macOS to become the default app for .md files. " \
          "If the request is declined, select a .md file in Finder and use " \
          "File > Get Info > Open with > Mardo > Change All."
end
