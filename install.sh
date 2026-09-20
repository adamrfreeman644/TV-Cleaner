#!/usr/bin/env bash
set -e
REPO="https://github.com/adamrfreeman644/TV-Cleaner.git"
APP="/mnt/user/appdata/tv-cleaner"
if [ "${1:-}" != "--launcher-only" ]; then
  if [ -d "$APP/.git" ]; then git -C "$APP" fetch --tags origin; else mkdir -p "$(dirname "$APP")"; git clone "$REPO" "$APP"; fi
fi
chmod +x "$APP/tv-cleaner" "$APP/install.sh"
cat >/usr/local/bin/tv-cleaner <<EOF
#!/usr/bin/env bash
exec "$APP/tv-cleaner" "\$@"
EOF
chmod +x /usr/local/bin/tv-cleaner
echo "Installed. Run: tv-cleaner"
