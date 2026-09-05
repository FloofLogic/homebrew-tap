# Floof Logic Homebrew tap

This tap distributes signed Floof Logic releases through declarative Homebrew
metadata. It does not build or sign the products.

## Mardo

[Mardo](https://github.com/FloofLogic/mardo) is the native file-first Markdown
viewer and editor for macOS:

```sh
brew install --cask flooflogic/tap/mardo
mardo --version
mardo "notes.md"
```

The cask installs the same immutable, signed, and notarized Mardo archive as
the direct download from [mardo.app](https://mardo.app/) and exposes only the
`mardo` command.

## FloofClaw

```sh
brew install flooflogic/tap/floofclaw
```
