#!/usr/bin/env bash

# Install Python dependencies
pip install -r requirements.txt

# Install Chrome
mkdir -p /opt/render/project/.render/chrome
cd /opt/render/project/.render/chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get update && apt-get install -y ./google-chrome-stable_current_amd64.deb

# Set environment variables
export CHROME_BIN=/usr/bin/google-chrome
export PATH=$PATH:/usr/bin

# Install matching ChromeDriver
CHROME_VERSION=$(google-chrome --version | grep -oP "\d+\.\d+\.\d+")
wget -N https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROME_VERSION}/linux64/chromedriver-linux64.zip -P ~/
unzip -o ~/chromedriver-linux64.zip -d ~/chromedriver
mv -f ~/chromedriver/chromedriver /usr/local/bin/chromedriver
chmod 755 /usr/local/bin/chromedriver
