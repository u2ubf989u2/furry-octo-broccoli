cask "joplin" do
  version "2.5.12"
  sha256 "e5e2937d94695bb218c05b7c4de262cadaf012988706037893d92d87e2e1d01a"

  url "https://github.com/laurent22/joplin/releases/download/v#{version}/Joplin-#{version}.dmg",
      verified: "github.com/laurent22/joplin/"
  name "Joplin"
  desc "Note taking and to-do application with synchronization capabilities"
  homepage "https://joplinapp.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Joplin.app"

  zap trash: [
    "~/Library/Application Support/Joplin",
    "~/Library/Preferences/net.cozic.joplin-desktop.helper.plist",
    "~/Library/Preferences/net.cozic.joplin-desktop.plist",
    "~/Library/Saved Application State/net.cozic.joplin-desktop.savedState",
  ]
end
