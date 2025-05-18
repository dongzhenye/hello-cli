# hello

[![Go Report Card](https://goreportcard.com/badge/github.com/dongzhenye/hello)](https://goreportcard.com/report/github.com/dongzhenye/hello)
[![Release](https://img.shields.io/github/v/release/dongzhenye/hello?include_prereleases&sort=semver)](https://github.com/dongzhenye/hello/releases/latest)
[![License](https://img.shields.io/github/license/dongzhenye/hello)](./LICENSE)

> **Say hello to your terminal — and it finally answers.**

## What is `hello`?

`hello` is the tiniest conversation-starter for your command line.  
Type `hello`, hit ⏎, and the shell greets you back with the classic `Hello, world!`

Nothing to configure, nothing to install at runtime—just a single, static,
≈ 1 MiB executable that proves your terminal is alive (and friendly).

## Why bother?

* On a fresh Windows box, `hello` used to be a dead end—**now it talks**.  
* The quickest smoke-test for a new shell, VM, container or CI runner.  
* Living "Hello, world!" demo that shows **Go + GoReleaser + winget** in action.  
* It makes you smile.  Sometimes that's enough.

## Features

| Feature | Description |
|---------|-------------|
| ⚡ **Instant install** | `winget install hello` (Windows 10/11) — done in seconds. |
| 🪶 **Feather-weight** | ~1 MiB static binary; no DLLs, no .NET, no Python. |
| 🔌 **Zero dependencies** | Built with `CGO_ENABLED=0`; runs on vanilla PowerShell / CMD. |
| 🌐 **Cross-platform build** | Linux / macOS binaries generated from the same repo. |
| 🛠 **Great sample project** | Shows how to ship a CLI with GitHub Actions + GoReleaser + winget. |
| ❤️ **Open Source** | MIT licence—hack away or reuse in your own demos. |

> *Road-map: emoji / colour output, `--name` flag, self-update, Scoop & Chocolatey taps…*

## Quick Start

### Windows 10 / 11

```powershell
winget install hello
hello
```

### macOS / Linux

```bash
go install github.com/dongzhenye/hello@latest
hello
```

Or grab a pre-built zip from the
[Releases page](https://github.com/dongzhenye/hello/releases).

## Why Go?

| Aspect | Go (this project) | Rust | .NET AOT | C / C++ | Node (pkg) |
|--------|-------------------|------|----------|---------|------------|
| Single binary | ✔ | toolchain tweaks | 5 – 6 MiB | manual | 60 MiB |
| Cross-compile | one env var | complex | limited | per-SDK | gaps |
| Build system | **GoReleaser** | cargo-release | MSBuild | none | manual |
| Learning curve | 15 min | steep | medium | memory mgmt | easiest |
| AV false alarms | low | medium | lowest | medium | medium |

Go hits the sweet spot of **tiny output, trivial cross-compile and fast iteration**,
with an ecosystem tailor-made for CLI shipping.

## Build from Source

### macOS

```bash
brew install go git goreleaser gh upx
git clone https://github.com/dongzhenye/hello
cd hello
go build -o hello
./hello
```

### Windows

```powershell
winget install -e --id Git.Git
winget install -e --id GoReleaser.GoReleaser
git clone https://github.com/dongzhenye/hello
cd hello
go build -o hello.exe
.\hello.exe
```

## Contributing

Bug reports, feature requests and PRs are welcome!  
See [CONTRIBUTING.md](./CONTRIBUTING.md) for details.

## License

`hello` is released under the MIT License.  
See the full text in [LICENSE](./LICENSE).
