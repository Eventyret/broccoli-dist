# broccoli

Install and updates for **broccoli**, the interactive CLI for managing Plume client environments. The source lives in a private repo; this repo only carries the install scripts and the prebuilt binaries.

## Install

**macOS / Linux:**

```sh
curl -fsSL https://raw.githubusercontent.com/Eventyret/broccoli-dist/main/install.sh | bash
```

**Windows (PowerShell):**

```powershell
irm https://raw.githubusercontent.com/Eventyret/broccoli-dist/main/install.ps1 | iex
```

That downloads the right binary for your machine, puts it on your PATH, and you run `broccoli` from anywhere. No clone, no build, no GitHub login.

Install somewhere specific by setting `BROCCOLI_BIN_DIR` first.

While broccoli is invite-only, the first run asks for an **access key** (enter it once per machine). Ask Simen for it.

## Update

```sh
broccoli --update
```

On Windows, re-run the PowerShell install command above.

## Binaries

Each [release](https://github.com/Eventyret/broccoli-dist/releases/latest) attaches:

| Platform | Asset |
| --- | --- |
| Apple Silicon Mac | `broccoli-macos-arm64` |
| Intel Mac | `broccoli-macos-x64` |
| Linux x64 | `broccoli-linux-x64` |
| Linux arm64 | `broccoli-linux-arm64` |
| Windows x64 | `broccoli-windows-x64.exe` |
