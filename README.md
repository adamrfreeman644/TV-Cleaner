# TV Cleaner

Terminal-based Jellyfin TV library cleaner for Unraid.

## v0.1.0
- Read-only source scan with ffprobe durations.
- Guided show/season cleanup.
- Understands `Show/Season/Disc` and `Show/Season/Disk` source layouts.
- Flattens disc folders into Jellyfin `Show/Season 01/Show S01E01.ext` layout.
- Detects a conservative Play-All case when one long title approximately equals the sum of two or more shorter episode-length titles.
- Quarantines detected Play-All and short extra candidates outside the Jellyfin library.
- Collision protection and operation logging.
- No video deletion.
- Git/tag based updater.

Default paths:
- Source: `/mnt/user/Media/UNFINISHED - NEEDS SORTING/TV`
- Destination: `/mnt/user/Media/2 ~ TV`
- Quarantine: `/mnt/user/Media/UNFINISHED - NEEDS SORTING/TV Duplicates`

## Install on Unraid

Requires `git` and `ffprobe`.

```bash
git clone https://github.com/adamrfreeman644/TV-Cleaner.git /mnt/user/appdata/tv-cleaner
bash /mnt/user/appdata/tv-cleaner/install.sh --launcher-only
tv-cleaner
```

Run **Scan source** first. It is read-only. Guided Cleanup previews a season and requires confirmation before moving files.

Configuration is created on first run at `/mnt/user/appdata/tv-cleaner/config.conf`.

### Important v0.1.0 limitation
Duration and disc/title ordering cannot prove episode identity on every DVD/Blu-ray. The guided screen must be reviewed before Apply. Short videos are treated as extra candidates and quarantined rather than deleted.
