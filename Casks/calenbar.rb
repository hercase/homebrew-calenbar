cask "calenbar" do
  version "0.7.0"
  sha256 "55ba08157b26ed2536933c82ec0a9168328f03c09984df3c125bffd6d7771a52"

  url "https://github.com/hercase/calenbar/releases/download/v#{version}/Calenbar-#{version}.dmg"
  name "Calenbar"
  desc "Your next meeting, in the menu bar"
  homepage "https://hercase.github.io/calenbar/"

  livecheck do
    url "https://hercase.github.io/calenbar/appcast.xml"
    strategy :sparkle
  end

  # The app updates itself through Sparkle; brew should not fight it.
  auto_updates true
  depends_on macos: :sonoma

  app "Calenbar.app"

  # The DMG installs to /Applications or ~/Applications and the app updates itself, so a brew install
  # on top of that would only create a second copy. Stop before doing anything if one exists.
  preflight_steps do
    # Homebrew already refuses to overwrite /Applications/Calenbar.app; a copy in ~/Applications (where the
    # app moves itself on first launch) would otherwise end up duplicated. Fail the install instead.
    if_path_exists "#{Dir.home}/Applications/Calenbar.app" do
      run "/bin/sh", args: ["-c", "echo 'Calenbar is already installed in ~/Applications and updates itself. " \
                                  "Move it to the Trash first to manage it with Homebrew.' >&2; exit 1"]
    end
  end

  zap trash: [
    "~/Library/Caches/com.hernancase.calenbar",
    "~/Library/Preferences/com.hernancase.calenbar.plist",
  ]
end
