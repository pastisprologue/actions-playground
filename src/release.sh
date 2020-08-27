#! /bin/bash

MAJOR=$(awk '/^#define APP_VERSION_MAJOR/{printf $3}' config.h)
MINOR=$(awk '/^#define APP_VERSION_MINOR/{printf $3}' config.h)
PATCH=$(awk '/^#define APP_VERSION_PATCH/{printf $3}' config.h)
PATCH=$(awk '/^#define APP_VERSION_PATCH/{printf $3}' config.h)
RC=$(awk '/^#define APP_VERSION_PRERELEASE/{print $3}' config.h | tr -d '"\r') 
NEW_PATCH="$(($PATCH + 1))"

sed -i'.bak' "s/#define APP_VERSION_PATCH $PATCH/#define APP_VERSION_PATCH $NEW_PATCH/g" config.h 
sed -i'.bak' "s/#define APP_VERSION_PRERELEASE $RC/#define APP_VERSION_PRERELEASE \"-dev\"/g" config.h

echo "v$MAJOR.$MINOR.$PATCH post"
