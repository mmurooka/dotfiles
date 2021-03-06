#!/bin/sh

# source-code-pro
# ~~~~~~~~~~~~~~~


if [ "`uname`" != "Linux" ]; then
  echo "This script only supports Darwin."
  exit 1
fi

if [ -f ~/.fonts/SourceCodePro-Black.otf ]; then
  echo "Font SourceCodePro is already installed."
  exit 1
fi


cd /tmp
wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip
unzip 1.030R-it.zip

mkdir -p ~/.fonts
cp source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf ~/.fonts/
fc-cache -f -v