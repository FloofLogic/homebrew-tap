cask "mardo" do
  version "1.0.0"
  sha256 "aa03ebac12bbb2a0a2d9dc778583727792d0256a8f814988e3f3f4bc6217af4f"

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
    # The signed helper asks macOS to make Mardo the .md default once per user.
    # A denied OS consent request must not remove an otherwise usable app.
    system_command "#{application}/Contents/Helpers/mardo",
                   args: ["--claim-markdown-default-once"], must_succeed: false
  end

  caveats "Mardo asks macOS to become the default app for .md files on first install. " \
          "If the request is declined, select a .md file in Finder and use " \
          "File > Get Info > Open with > Mardo > Change All."
end
