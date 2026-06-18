#!/usr/bin/env bash
set -euo pipefail

REPO="Eventyret/broccoli-dist"
BIN="broccoli"
DIR="${BROCCOLI_BIN_DIR:-$HOME/.local/bin}"

os="$(uname -s)"
arch="$(uname -m)"
case "$os" in
  Darwin) os="macos" ;;
  Linux) os="linux" ;;
  *) echo "Unsupported OS: $os. On Windows, use PowerShell: irm https://raw.githubusercontent.com/$REPO/main/install.ps1 | iex"; exit 1 ;;
esac
case "$arch" in
  arm64 | aarch64) arch="arm64" ;;
  x86_64 | amd64) arch="x64" ;;
  *) echo "Unsupported architecture: $arch"; exit 1 ;;
esac
asset="${BIN}-${os}-${arch}"
url="https://github.com/$REPO/releases/latest/download/$asset"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
echo "Downloading $asset ..."
if ! curl -fsSL "$url" -o "$tmp/$BIN"; then
  echo "Download failed from $url"
  echo "Is there a published release yet? See https://github.com/$REPO/releases"
  exit 1
fi

mkdir -p "$DIR"
chmod +x "$tmp/$BIN"
mv "$tmp/$BIN" "$DIR/$BIN"
[ "$os" = "macos" ] && xattr -dr com.apple.quarantine "$DIR/$BIN" 2>/dev/null || true

echo "Installed $BIN to $DIR/$BIN"
case ":$PATH:" in
  *":$DIR:"*) echo "Run '$BIN' from anywhere now." ;;
  *)
    echo "Add it to your PATH, then restart your shell:"
    echo "  echo 'export PATH=\"$DIR:\$PATH\"' >> ~/.zshrc"
    ;;
esac
