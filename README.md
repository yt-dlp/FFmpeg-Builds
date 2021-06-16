# FFmpeg Static Auto-Builds

Shared Windows (x86 and x86_64) and static Linux (x86_64) Builds of ffmpeg master and latest release branch
with a [patch by @danny-wu](https://ffmpeg.org/pipermail/ffmpeg-devel/2021-May/280189.html)
that corrects VP9 timestamps. Fixes https://github.com/ytdl-org/youtube-dl/issues/28042.

Windows builds are targetting Windows 7 and newer.

Linux builds are targetting Ubuntu 16.04 (glibc-2.23 + linux-4.4) and anything more recent.

## Auto-Builds

Builds run daily at 12:00 UTC (or GitHubs idea of that time) and are automatically released on success.

**Auto-Builds run ONLY for win64 and linux64. There are no win32/x86 auto-builds, though you can produce win32 builds yourself following the instructions below.**

### Release Retention Policy

- The last build of each month is kept for two years.
- The last 14 daily builds are kept.

## Package List

For a list of included dependencies check the scripts.d directory.
Every file corresponds to its respective package.

## How to make a build

### Prerequisites

* bash
* docker

### Build Image

* `./makeimage.sh target variant [addins]`

### Build FFmpeg

* `./build.sh target variant [addins]`

On success, the resulting zip file will be in the `artifacts` subdir.

### Targets, Variants and Addins

Available targets:
* `win64` (x86_64 Windows)
* `win32` (x86 Windows)
* `linux64` (x86_64 Linux, glibc>=2.23, linux>=4.4)

Available:
* `gpl` Includes all dependencies, even those that require full GPL instead of just LGPL.
* `lgpl` Lacking libraries that are GPL-only. Most prominently libx264 and libx265.
* `gpl-shared` Same as gpl, but comes with the libav* family of shared libs instead of pure static executables.
* `lgpl-shared` Same again, but with the lgpl set of dependencies.

All of those can be optionally combined with any combination of addins.
* `4.4` to build from the 4.4 release branch instead of master.
* `debug` to not strip debug symbols from the binaries. This increases the output size by about 250MB.
