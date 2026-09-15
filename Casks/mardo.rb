cask "mardo" do
  version "0.9.23"
  sha256 "2c68e2770573d401ef12686043bfa5941ddede9986fa769134ff1b4c72ac942f"

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

  postflight_steps do
    run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
        args: ["-f", "-R", "{{appdir}}/Mardo.app"]
    run "/usr/bin/pluginkit",
        args: ["-a", "{{appdir}}/Mardo.app/Contents/PlugIns/MardoPreview.appex"]
    run "/usr/bin/pluginkit",
        args: ["-a", "{{appdir}}/Mardo.app/Contents/PlugIns/MardoThumbnail.appex"]
    run "/usr/bin/pluginkit",
        args: ["-e", "use", "-i", "com.flooflogic.mardo.QLPreview"]
    run "/usr/bin/pluginkit",
        args: ["-e", "use", "-i", "com.flooflogic.mardo.QLThumbnail"]
    run "/usr/bin/qlmanage", args: ["-r"]
    run "/usr/bin/qlmanage", args: ["-r", "cache"]
    terminate_process "QuickLookUIService"
    terminate_process "quicklookd"
    terminate_process "com.apple.quicklook.ThumbnailsAgent"
  end
end
