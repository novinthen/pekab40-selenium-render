#!/usr/bin/env bash

# Install Chromium (for Selenium)
CHROME_VERSION=136.0.0.0

mkdir -p .render/chrome
curl -sSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb
dpkg -x chrome.deb .render/chrome/
mv .render/chrome/opt/google/chrome .render/chrome/
rm -rf chrome.deb

# Make Chrome binary path available
echo "CHROME_BINARY_PATH=.render/chrome/google-chrome" > .env

# ✅ Install Python dependencies
pip install -r requirements.txt
