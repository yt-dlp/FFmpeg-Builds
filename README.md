# FFmpeg Static Auto-Builds


This repository provides static Windows (x86 and x86_64) and Linux (x86_64, arm64) Builds of [ffmpeg master](https://github.com/FFmpeg/FFmpeg) and [latest release branch](https://github.com/FFmpeg/FFmpeg/tree/release/4.4) **with some patches necessary for smooth integration with [yt-dlp](https://github.com/yt-dlp/yt-dlp)**

**Note**: The builds provided are only meant to be used with yt-dlp and any unrelated issues/patches will be rejected


## Downloads

[![Linux x64 GPL master](https://img.shields.io/badge/-Linux_x64-red.svg?style=for-the-badge&logo=linux)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz "Linux x64 GPL master")
[![Linux ARM64 GPL master](https://img.shields.io/badge/-Linux_ARM64-red.svg?style=for-the-badge&logo=linux)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linuxarm64-gpl.tar.xz "Linux ARM64 GPL master")
[![Windows x64 GPL master](https://img.shields.io/badge/-Windows_x64-blue.svg?style=for-the-badge&logo=windows)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip "Windows x64 GPL master")
[![Windows x86 GPL master](https://img.shields.io/badge/-Windows_x86-9cf.svg?style=for-the-badge&logo=windows)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win32-gpl.zip "Windows x86 GPL master")
[![Other variants](https://img.shields.io/badge/-Other-grey.svg?style=for-the-badge)](https://github.com/yt-dlp/FFmpeg-Builds/wiki/Latest "All variants")
[![Other versions](https://img.shields.io/badge/-Old_Versions-lightgrey.svg?style=for-the-badge)](https://github.com/yt-dlp/FFmpeg-Builds/releases "All releases")

---




## Patches Welcome
Known issues for which patches are welcome

<!--
*Nothing at the moment*
-->

#### 1. More Builds

There are currently no MacOS/Windows ARM builds. If you know how to add them to the workflow, make a PR



## Historical Patches
Patches that were used in the past but are no longer needed

#### 1. [Fix AAC HLS streams being truncated mid stream](https://patchwork.ffmpeg.org/project/ffmpeg/patch/20210927213133.28258-1-jeebjp@gmail.com)
by [@shirt](https://github.com/shirt-dev) and [@jeeb](https://github.com/jeeb), merged in [c205778](https://github.com/FFmpeg/FFmpeg/commit/c20577806f0a161c6867e72f884d020a253de10a)
Fixes [yt-dlp#618](https://github.com/yt-dlp/yt-dlp/issues/618), [yt-dlp#998](https://github.com/yt-dlp/yt-dlp/issues/998), [yt-dlp#1039](https://github.com/yt-dlp/yt-dlp/issues/1039), [FFmpeg#9433](https://trac.ffmpeg.org/ticket/9433)

#### 2. [Fix for YouTube's VP9 encodes with non-monotonous DTS](https://ffmpeg.org/pipermail/ffmpeg-devel/2021-May/280189.html)
by [@danny-wu](https://github.com/danny-wu), merged in [68595b4](https://github.com/FFmpeg/FFmpeg/commit/68595b46cb374658432fff998e82e5ff434557ac)
Fixes [yt-dlp#871](https://github.com/yt-dlp/yt-dlp/issues/871), [youtube-dl#28042](https://github.com/ytdl-org/youtube-dl/issues/28042), [FFmpeg#9086](https://trac.ffmpeg.org/ticket/9086)

#### 3. Long path support for Windows
by [@nihil-admirari](https://github.com/nihil-admirari).
Fixes [yt-dlp#1995](https://github.com/yt-dlp/yt-dlp/issues/1995),
[yt-dlp#1273](https://github.com/yt-dlp/yt-dlp/issues/1273),
[FFmpeg#8885](https://trac.ffmpeg.org/ticket/8885).

Patch has been substantially reworked by FFmpeg devs
[@softworkz](https://github.com/softworkz)
and [@mstorsjo](https://github.com/mstorsjo),
and merged in a series of commits:
- [3fb9244](https://github.com/FFmpeg/FFmpeg/commit/3fb924464244bc317a5d19ab25625ae35abde512)
- [4cdc14a](https://github.com/FFmpeg/FFmpeg/commit/4cdc14aa955805931b918d30d9c7349ab924dd52)
- [6076dbc](https://github.com/FFmpeg/FFmpeg/commit/6076dbcb55d0c9b6693d1acad12a63f7268301aa)
- [f579a1d](https://github.com/FFmpeg/FFmpeg/commit/f579a1d08b269b6dfc89596af20582c01950adb2)
- [6b32ad5](https://github.com/FFmpeg/FFmpeg/commit/6b32ad59c8fe16fc792ca5a468b95ce5232ff6d1)
- [c5aba39](https://github.com/FFmpeg/FFmpeg/commit/c5aba39a041fdaac267fc8c6a2ef745a94a2b0da)
- [bc8f1bb](https://github.com/FFmpeg/FFmpeg/commit/bc8f1bbe233b435dc474df272dac0b5b6d0ef536)
- [5d5a014](https://github.com/FFmpeg/FFmpeg/commit/5d5a01419928d0c00bae54f730eede150cd5b268)
- [3b3c567](https://github.com/FFmpeg/FFmpeg/commit/3b3c567ad3d45a3f5d90668a1dd32f11b89fc4b5)
- [fee765c](https://github.com/FFmpeg/FFmpeg/commit/fee765c2078ba03e346e311c86a447a116fe8c5f)
- [cc5844d](https://github.com/FFmpeg/FFmpeg/commit/cc5844da988fb7ca1051775a3dac43de77bf3881)
- [dfa062e](https://github.com/FFmpeg/FFmpeg/commit/dfa062ed3cae1d7ae3fdc52c7adda09cfc2e29b9)
- [13350e8](https://github.com/FFmpeg/FFmpeg/commit/13350e81fd43cbd1aa3bbb7ed567e7dc7dd2b7f5)
- [c381f54](https://github.com/FFmpeg/FFmpeg/commit/c381f5412fe810bd8118123aed9bd4f76b75b59d)
- [69364a0](https://github.com/FFmpeg/FFmpeg/commit/69364a06c65d3437e8158cdffd98c2f6d1b84dd2)

The version merged into FFmpeg's `master` does not apply cleanly on FFmpeg's
`release/5.0` branch. Release builds continue to use [an old version of
the patch](https://ffmpeg.org/pipermail/ffmpeg-devel/2022-April/295569.html)
with small modifications from [the version of the patch](
https://ffmpeg.org/pipermail/ffmpeg-devel/2022-June/297841.html)
that actually landed in FFmpeg's `master`.



## Credits

* [@BtbN](https://github.com/BtbN) for the [original workflow](https://github.com/BtbN/FFmpeg-Builds)
* [@nihil-admirari](https://github.com/nihil-admirari) for creating and maintaining this repo

---

PS: The commits are unsigned because of the periodic [automatic rebase](https://github.com/yt-dlp/FFmpeg-Builds/actions/workflows/rebase-on-upstream.yml)
