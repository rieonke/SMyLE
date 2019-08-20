#!/usr/bin/env bash
# -*- tab-width: 4; encoding: utf-8 -*-
echo "Removing ~/.smyle"
if [ -d ~/.smyle ]
then
  rm -rf ~/.smyle
fi

git clone https://github.com/rieonke/SMyLE.git ~/.smyle

if [ command -v >&- jq ]
then
    if [ $OSTYPE == "darwin"* ]
    then
        brew install jq
    fi
fi


