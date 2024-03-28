# FFmpeg Static Auto-Builds


This repository provides static Windows (x86 and x86_64) and Linux (x86_64, arm64) Builds of [FFmpeg master](https://github.com/FFmpeg/FFmpeg) and [latest release branch](https://github.com/FFmpeg/FFmpeg/tree/release/6.1) **with some patches necessary for smooth integration with [yt-dlp](https://github.com/yt-dlp/yt-dlp)**

**Note**: The builds provided are only meant to be used with yt-dlp and any unrelated issues/patches will be rejected


## Downloads

[![Linux x64 GPL master](https://img.shields.io/badge/-Linux_x64-crimson.svg?style=for-the-badge&logo=linux)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz "Linux x64 GPL master")
[![Linux ARM64 GPL master](https://img.shields.io/badge/-Linux_ARM64-orangered.svg?style=for-the-badge&logo=linux)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linuxarm64-gpl.tar.xz "Linux ARM64 GPL master")
[![Windows x64 GPL master](https://img.shields.io/badge/-Windows_x64-blue.svg?style=for-the-badge&logo=windows)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip "Windows x64 GPL master")
[![Windows x86 GPL master](https://img.shields.io/badge/-Windows_x86-9cf.svg?style=for-the-badge&logo=windows)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win32-gpl.zip "Windows x86 GPL master")
[![Windows ARM64 GPL master](https://img.shields.io/badge/-Windows_arm64-lightblue.svg?style=for-the-badge&logo=windows)](https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-winarm64-gpl.zip "Windows ARM64 GPL master")
[![Other variants](https://img.shields.io/badge/-Other-grey.svg?style=for-the-badge)](https://github.com/yt-dlp/FFmpeg-Builds/wiki/Latest "All variants")
[![Other versions](https://img.shields.io/badge/-Old_Versions-lightgrey.svg?style=for-the-badge)](https://github.com/yt-dlp/FFmpeg-Builds/releases "All releases")

---




## Patches Welcome
Known issues for which patches are welcome:

### 1. More Builds

There are currently no MacOS builds. If you know how to add them to the workflow, make a PR

### 2. Removing a segment before the first subtitle

[yt-dlp#2753](https://github.com/yt-dlp/yt-dlp/issues/2753), [FFmpeg#9646](https://trac.ffmpeg.org/ticket/9646)



<!--
## Patches Applied
These patches have been applied to the builds:
-->



## Release-only patches
Patches that have been merged in FFmpeg master, but not in FFmpeg's latest release:

### 1. [WebVTT decoding fix](https://ffmpeg.org/pipermail/ffmpeg-devel/2022-May/296353.html)

by [@tpikonen](https://github.com/tpikonen).
Fixes [yt-dlp#4127](https://github.com/yt-dlp/yt-dlp/issues/4127), [FFmpeg#8684](https://trac.ffmpeg.org/ticket/8684)

Fixed upstream by [@ztion](https://github.com/ztion); merged in [51d303e](https://github.com/FFmpeg/FFmpeg/commit/51d303e20cbb0874172f50b5172c515a973587d4).


## Historical Patches
Patches that were used in the past but are no longer needed as of **6.1**:

### 1. [Fix AAC HLS streams being truncated mid stream](https://patchwork.ffmpeg.org/project/ffmpeg/patch/20210927213133.28258-1-jeebjp@gmail.com)

by [@shirt](https://github.com/shirt-dev) and [@jeeb](https://github.com/jeeb), merged in [c205778](https://github.com/FFmpeg/FFmpeg/commit/c20577806f0a161c6867e72f884d020a253de10a).
Fixes [yt-dlp#618](https://github.com/yt-dlp/yt-dlp/issues/618), [yt-dlp#998](https://github.com/yt-dlp/yt-dlp/issues/998), [yt-dlp#1039](https://github.com/yt-dlp/yt-dlp/issues/1039), [FFmpeg#9433](https://trac.ffmpeg.org/ticket/9433)

### 2. [Fix for YouTube's VP9 encodes with non-monotonous DTS](https://ffmpeg.org/pipermail/ffmpeg-devel/2021-May/280189.html)

by [@danny-wu](https://github.com/danny-wu), merged in [68595b4](https://github.com/FFmpeg/FFmpeg/commit/68595b46cb374658432fff998e82e5ff434557ac)
Fixes [yt-dlp#871](https://github.com/yt-dlp/yt-dlp/issues/871), [youtube-dl#28042](https://github.com/ytdl-org/youtube-dl/issues/28042), [FFmpeg#9086](https://trac.ffmpeg.org/ticket/9086)

### 3. Long path support for Windows

by [@nihil-admirari](https://github.com/nihil-admirari).
Fixes [yt-dlp#1995](https://github.com/yt-dlp/yt-dlp/issues/1995),
[yt-dlp#1273](https://github.com/yt-dlp/yt-dlp/issues/1273),
[FFmpeg#8885](https://trac.ffmpeg.org/ticket/8885).

This patch has been substantially reworked by FFmpeg devs
[@softworkz](https://github.com/softworkz) and
[@mstorsjo](https://github.com/mstorsjo),
and merged in a series of commits:
[3fb9244](https://github.com/FFmpeg/FFmpeg/commit/3fb924464244bc317a5d19ab25625ae35abde512)
[4cdc14a](https://github.com/FFmpeg/FFmpeg/commit/4cdc14aa955805931b918d30d9c7349ab924dd52)
[6076dbc](https://github.com/FFmpeg/FFmpeg/commit/6076dbcb55d0c9b6693d1acad12a63f7268301aa)
[f579a1d](https://github.com/FFmpeg/FFmpeg/commit/f579a1d08b269b6dfc89596af20582c01950adb2)
[6b32ad5](https://github.com/FFmpeg/FFmpeg/commit/6b32ad59c8fe16fc792ca5a468b95ce5232ff6d1)
[c5aba39](https://github.com/FFmpeg/FFmpeg/commit/c5aba39a041fdaac267fc8c6a2ef745a94a2b0da)
[bc8f1bb](https://github.com/FFmpeg/FFmpeg/commit/bc8f1bbe233b435dc474df272dac0b5b6d0ef536)
[5d5a014](https://github.com/FFmpeg/FFmpeg/commit/5d5a01419928d0c00bae54f730eede150cd5b268)
[3b3c567](https://github.com/FFmpeg/FFmpeg/commit/3b3c567ad3d45a3f5d90668a1dd32f11b89fc4b5)
[fee765c](https://github.com/FFmpeg/FFmpeg/commit/fee765c2078ba03e346e311c86a447a116fe8c5f)
[cc5844d](https://github.com/FFmpeg/FFmpeg/commit/cc5844da988fb7ca1051775a3dac43de77bf3881)
[dfa062e](https://github.com/FFmpeg/FFmpeg/commit/dfa062ed3cae1d7ae3fdc52c7adda09cfc2e29b9)
[13350e8](https://github.com/FFmpeg/FFmpeg/commit/13350e81fd43cbd1aa3bbb7ed567e7dc7dd2b7f5)
[c381f54](https://github.com/FFmpeg/FFmpeg/commit/c381f5412fe810bd8118123aed9bd4f76b75b59d)
[69364a0](https://github.com/FFmpeg/FFmpeg/commit/69364a06c65d3437e8158cdffd98c2f6d1b84dd2)

### 4. [Chapter embedding regression](https://ffmpeg.org/pipermail/ffmpeg-devel/2023-October/316365.html)

by [@bashonly](https://github.com/bashonly).
Fixes [FFmpeg#10482](https://trac.ffmpeg.org/ticket/10482)

Fixed upstream by [@mkver](https://github.com/mkver); merged in [02064ba](https://github.com/FFmpeg/FFmpeg/commit/02064ba3a37754183cf7e7a4c1ffd3cdf971b5dc).

### 5. Support for HEVC over FLV

HEVC inside FLV has been [standardized](https://github.com/veovera/enhanced-rtmp/blob/8c51d437e20a9199d92f24d9950b1216e07f065f/enhanced-rtmp.pdf) by [@Veovera](https://github.com/veovera), implemented by [@T-bagwell](https://github.com/T-bagwell) and merged to FFmpeg master in [aa83654](https://github.com/FFmpeg/FFmpeg/commit/aa83654d940e7599ee641fc5d0fcd10e7decf277) and [ac5cc66](https://github.com/FFmpeg/FFmpeg/commit/ac5cc66f9e4408c45c303f6bf482ff04d7cb355e).

Releases older than 6.1 used a non-standard implementation assembled from patches by [@xiaoxial](https://github.com/VCDP/CDN/blob/master/FFmpeg_patches/0001-Add-SVT-HEVC-FLV-support-on-FFmpeg.patch), [@runner365](https://github.com/runner365/ffmpeg_rtmp_h265/blob/5.1/flvenc.c), and [Matthieu Patou](https://patchwork.ffmpeg.org/project/ffmpeg/patch/20210701141528.776-1-jamrial@gmail.com/).
See [this comment](https://github.com/yt-dlp/yt-dlp/pull/5823#issuecomment-1366868753) for details.

Fixes [yt-dlp#5874](https://github.com/yt-dlp/yt-dlp/issues/5874), [FFmpeg#6389](https://trac.ffmpeg.org/ticket/6389).



## Credits

* [@BtbN](https://github.com/BtbN) for the [original workflow](https://github.com/BtbN/FFmpeg-Builds)
* [@nihil-admirari](https://github.com/nihil-admirari) for creating and maintaining this repo

---

PS: The commits are unsigned because of the periodic [automatic rebase](https://github.com/yt-dlp/FFmpeg-Builds/actions/workflows/rebase-on-upstream.yml)
