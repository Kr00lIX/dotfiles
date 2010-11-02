#!/bin/sh

SHDIR=$PWD
BACKUP="$SHDIR/backups/`date +'%Y%m%d-%H%M%S'`"

if [ ! -d $BACKUP ]; then
  mkdir -p $BACKUP
fi

# create symbol links for configuration files
cd "./config"

for FILE in `ls *`; do
  if [ ! -h "$HOME/.$FILE" ]; then
    if [ -f "$HOME/.$FILE" ]; then
      echo "backing up ~/.$FILE"
      mv "$HOME/.$FILE" "$BACKUP/$FILE"
    fi

    echo "installing ~/.$FILE"
    ln -s "$SHDIR/config/$FILE" "$HOME/.$FILE"
  fi
done
