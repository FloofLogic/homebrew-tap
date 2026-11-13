cask "mardo" do
  version "1.1.1"
  sha256 "ddab08deeef4d5d5b72dc3d75bbc53d47ba91f4990db5d11d4276e28dc892f93"

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
