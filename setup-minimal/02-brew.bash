#!/bin/bash
# This installs the Brewfile
brew bundle

# do some cleanup
brew cleanup --force
# rm -f -r /Library/Caches/Homebrew/*
