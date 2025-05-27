#!/usr/bin/env bash

# Install Chrome
mkdir -p .render/chrome
cd .render/chrome
wget https://storage.googleapis.com/chrome-for-testing-public/136.0.7103.113/linux64/chrome-linux64.zip
unzip chrome-linux64.zip
mv chrome-linux64/* .
rm -rf chrome-linux64.zip chrome-linux64
cd ../..

# Install ChromeDriver
mkdir -p .render/chromedriver
cd .render/chromedriver
wget https://storage.googleapis.com/chrome-for-testing-public/136.0.7103.113/linux64/chromedriver-linux64.zip
unzip chromedriver-linux64.zip
mv chromedriver-linux64/chromedriver .
chmod +x chromedriver
rm -rf chromedriver-linux64.zip chromedriver-linux64
