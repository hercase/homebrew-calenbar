cask "calenbar" do
  version "0.4.1"
  sha256 "6e40953df0eb81468463cd95eab34a18b15d17fbe00a3a49e44a6408eeab4d7b"

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

  # The DMG installs to /Applications or ~/Applications and the app updates itself, so a brew install
  # on top of that would only create a second copy. Stop before doing anything if one exists.
  preflight do
    existing = ["/Applications/Calenbar.app", "#{Dir.home}/Applications/Calenbar.app"].select { |path| File.exist?(path) }
    next if existing.empty?

    raise CaskError, <<~EOS
      Calenbar is already installed at #{existing.join(" and ")}, and that copy updates itself.
      To manage it with Homebrew instead, move it to the Trash first and run this install again.
    EOS
  end

  app "Calenbar.app"

  zap trash: [
    "~/Library/Caches/com.hernancase.calenbar",
    "~/Library/Preferences/com.hernancase.calenbar.plist",
  ]
end
