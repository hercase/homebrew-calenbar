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

  app "Calenbar.app"

  zap trash: [
    "~/Library/Caches/com.hernancase.calenbar",
    "~/Library/Preferences/com.hernancase.calenbar.plist",
  ]
end
