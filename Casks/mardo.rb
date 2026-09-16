cask "mardo" do
  version "0.9.24"
  sha256 "fbd8add7cf23ea232128a82447e7aa32ba64f70b37aec37d1911c01f43df1c0b"

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

  # PlugInKit needs Mach services that Homebrew's structured-step sandbox blocks.
  postflight do
    application = "#{appdir}/Mardo.app"
    preview = "#{application}/Contents/PlugIns/MardoPreview.appex"
    thumbnail = "#{application}/Contents/PlugIns/MardoThumbnail.appex"
    launch_services = "/System/Library/Frameworks/CoreServices.framework/" \
                      "Frameworks/LaunchServices.framework/Support/lsregister"

    system_command launch_services, args: ["-f", "-R", application]
    system_command "/usr/bin/pluginkit", args: ["-a", preview]
    system_command "/usr/bin/pluginkit", args: ["-a", thumbnail]
    system_command "/usr/bin/pluginkit",
                   args: ["-e", "use", "-i", "com.flooflogic.mardo.QLPreview"]
    system_command "/usr/bin/pluginkit",
                   args: ["-e", "use", "-i", "com.flooflogic.mardo.QLThumbnail"]
    system_command "/usr/bin/qlmanage", args: ["-r"]
    system_command "/usr/bin/qlmanage", args: ["-r", "cache"]
    system_command "/usr/bin/killall",
                   args: ["-9", "QuickLookUIService", "quicklookd",
                          "com.apple.quicklook.ThumbnailsAgent"],
                   must_succeed: false, print_stderr: false
  end
end
