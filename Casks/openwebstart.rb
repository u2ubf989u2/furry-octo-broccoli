cask "openwebstart" do
  version "1.5.0"
  sha256 "30aee9333dcbdb2b925ec34c66803f973f6504760494b24fe61e013917106921"

  url "https://github.com/karakun/OpenWebStart/releases/download/v#{version}/OpenWebStart_macos_#{version.dots_to_underscores}.dmg",
      verified: "github.com/karakun/OpenWebStart/"
  name "OpenWebStart"
  desc "Tool to run Java Web Start-based applications after the release of Java 11"
  homepage "https://openwebstart.com/"

  installer script: {
    executable:   "#{staged_path}/OpenWebStart Installer.app/Contents/MacOS/JavaApplicationStub",
    args:         ["-q"],
    sudo:         true,
    print_stderr: false,
  }

  uninstall_preflight do
    set_ownership "/Applications/OpenWebStart"
  end

  uninstall script: {
    executable: "/Applications/OpenWebStart/OpenWebStart Uninstaller.app/Contents/MacOS/JavaApplicationStub",
    args:       ["-c"],
    sudo:       true,
  }

  zap trash: [
    "~/.config/icedtea-web",
    "~/.cache/icedtea-web",
    "/Applications/OpenWebStart",
  ]
end
