# Homebrew tap for Calenbar

```sh
brew install --cask hercase/calenbar/calenbar
```

Homebrew asks you to trust this tap the first time (or run `brew trust hercase/calenbar` once).
Calenbar isn't notarized by Apple, so the first launch needs System Settings › Privacy & Security › Open Anyway;
if you trust the source you can skip that too: `brew install --cask --no-quarantine hercase/calenbar/calenbar`.

The app updates itself (Sparkle); `brew upgrade` is not needed. The cask here is updated by
[calenbar's release script](https://github.com/hercase/calenbar/blob/main/scripts/release.sh).
