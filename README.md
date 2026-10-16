# Homebrew tap for Calenbar

[Calenbar](https://hercase.github.io/calenbar/) keeps your next meeting in the Mac menu bar, with a countdown and one-click Join. Source: [hercase/calenbar](https://github.com/hercase/calenbar).

```sh
brew install --cask hercase/calenbar/calenbar
```

Homebrew asks you to trust this tap the first time (or run `brew trust hercase/calenbar` once).

Calenbar isn't notarized by Apple, so the first launch needs System Settings › Privacy & Security › Open Anyway ([guide](https://hercase.github.io/calenbar/install.html)). If you trust the source you can skip that too: `brew install --cask --no-quarantine hercase/calenbar/calenbar`.

The app updates itself through Sparkle, so `brew upgrade` isn't needed. If Calenbar is already installed in /Applications or ~/Applications, the cask stops instead of adding a second copy.

The cask is updated by [calenbar's release script](https://github.com/hercase/calenbar/blob/main/scripts/release.sh) on every release. [What's new](https://hercase.github.io/calenbar/whats-new.html).
