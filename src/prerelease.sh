#! /bin/bash

# Get and Increment the Patch Number
PATCH=$(awk '/^#define APP_VERSION_PATCH/{printf $3}' src/config/sdk_config.h)
NEW_PATCH="$(($PATCH + 1))"

# Get the PreRelease String
PRS=$(awk '/^#define APP_VERSION_PRERELEASE.*/{printf $3}' src/config/sdk_config.h)

# Attempt to increment the PreRelease String Number, if it exists
if [[ -n $PRS ]]; then
    if [[ $PRS == *"rc"* ]]; then
        PRSN="${PRS//[!0-9]/}"
        if [[ -n $PRSN ]]; then
            NEW_PRSN="$(($PRSN + 1))"
        else
            NEW_PRSN=1
        fi
    else
        NEW_PRSN=1
    fi
fi

# Edit sdk_config in place
sed -i'.bak' "s/^#define APP_VERSION_PATCH.*/#define APP_VERSION_PATCH $NEW_PATCH/g" src/config/sdk_config.h 
sed -i'.bak' "s/^#define APP_VERSION_PRERELEASE.*/#define APP_VERSION_PRERELEASE \"-rc$NEW_PRSN\"/g" src/config/sdk_config.h

FETCH=$(git fetch)
BRANCH=$(git log --pretty=%d --decorate | sed -n 1p | awk '{print substr($3, 1, length($3)-1)}')
echo "Fetch: $FETCH"
echo "Branch: $BRANCH"
