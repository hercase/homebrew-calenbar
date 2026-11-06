cask "calenbar" do
  version "0.8.1"
  sha256 "6d00c14c7053145da0d3c186928c522d424fc7dca6924bf483b630914e48d5a9"

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
