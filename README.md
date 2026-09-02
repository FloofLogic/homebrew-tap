# Floof Logic Homebrew tap

This tap distributes signed Floof Logic releases through declarative Homebrew
metadata. It does not build or sign the products.

## Mardo

[`md` installs Mardo](https://github.com/FloofLogic/md), the native file-first
Markdown viewer and editor for macOS:

```sh
brew install --cask flooflogic/tap/md
md --version
```

The cask uses the same immutable, signed, and notarized Mardo archive as the
direct download from [mardo.app](https://mardo.app/).

## FloofClaw

```sh
brew install flooflogic/tap/floofclaw
```
