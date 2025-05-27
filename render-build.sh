
#!/usr/bin/env bash
set -eux

mkdir -p .render/chrome
cd .render/chrome

wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -x google-chrome-stable_current_amd64.deb .

mkdir -p opt/google/chrome
mv opt/google/chrome/* opt/google/chrome/
rm -rf etc usr
