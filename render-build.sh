#!/usr/bin/env bash
set -o errexit

# Print versions for debugging
echo "Using Python version: $(python --version)"
echo "Using pip version: $(pip --version)"

# Install Python packages
pip install --upgrade pip
pip install -r requirements.txt

# Fail on error
set -o errexit

# Install dependencies
apt-get update
apt-get install -y wget unzip curl gnupg

# Install Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/google.gpg
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get install -y google-chrome-stable

# Get Chrome version
CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+')

# Download matching ChromeDriver
CHROMEDRIVER_VERSION=$(curl -s "https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json" | jq -r --arg ver "$CHROME_VERSION" '.versions[] | select(.version | startswith($ver)) | .version' | head -n 1)

# Download and extract ChromeDriver
wget -O chromedriver.zip "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip"
unzip chromedriver.zip
mv chromedriver-linux64/chromedriver /usr/local/bin/chromedriver
chmod +x /usr/local/bin/chromedriver

# Clean up
rm -rf chromedriver.zip chromedriver-linux64
