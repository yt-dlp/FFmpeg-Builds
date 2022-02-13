# FFmpeg Static Auto-Builds

[![Release version](https://img.shields.io/github/v/release/yt-dlp/FFmpeg-Builds?color=blue&label=&style=for-the-badge)](https://github.com/yt-dlp/FFmpeg-Builds/releases/latest)

This repository provides static Windows (x86 and x86_64) and Linux (x86_64, arm64) Builds of [ffmpeg master](https://github.com/FFmpeg/FFmpeg) and [latest release branch](https://github.com/FFmpeg/FFmpeg/tree/release/4.4) **with some patches necesssary for smooth integration with [yt-dlp](https://github.com/yt-dlp/yt-dlp)**

**Note**: The builds provided are only meant to be used with yt-dlp and any unrelated issues/patches will be rejected




## Patches Applied
These patches have been applied to the builds

1. [**Fix for YouTube's VP9 encodes with non-monotonous DTS**](https://ffmpeg.org/pipermail/ffmpeg-devel/2021-May/280189.html) by [@danny-wu](https://github.com/danny-wu)
    * Fixes [yt-dlp#871](https://github.com/yt-dlp/yt-dlp/issues/871), [youtube-dl#28042](https://github.com/ytdl-org/youtube-dl/issues/28042), [FFmpeg#9086](https://trac.ffmpeg.org/ticket/9086)




## Patches Welcome
Known issues for which patches are welcome

1. **FFmpeg fails to decode AAC with embedded tags downloaded from HLS manifests**
    * [FFmpeg#9433](https://trac.ffmpeg.org/ticket/9433), [yt-dlp#618](https://github.com/yt-dlp/yt-dlp/issues/618), [yt-dlp#998](https://github.com/yt-dlp/yt-dlp/issues/998), [yt-dlp#1039](https://github.com/yt-dlp/yt-dlp/issues/1039)




## Credits

* [@BtbN](https://github.com/BtbN) for the [original workflow](https://github.com/BtbN/FFmpeg-Builds)
* [@nihil-admirari](https://github.com/nihil-admirari) for [applying patches to the workflow](https://github.com/nihil-admirari/FFmpeg-With-VP9-Timestamp-Fix/commit/1ccd5d63f03be0ab622eb657ff3acae8b76da4e9)

---

PS: The commits are unsigned because of the periodic [automatic rebase](https://github.com/yt-dlp/FFmpeg-Builds/actions/workflows/rebase-on-upstream.yml)
