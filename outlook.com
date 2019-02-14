#!/usr/bin/env bash

APP="https://outlook.live.com/mail/"
MAILTO="https://outlook.live.com/owa/default.aspx?path=/mail/action/compose#"

# find chrome

CHROME_BINS=(google-chrome chrome chromium chromium-browser)
PATH=/opt/google/chrome:${PATH}
for CHROME in ${CHROME_BINS[*]}; do
    [[ $(type -p ${CHROME}) ]] && break
done

# mailto handling

if [[ "$1" =~ ^mailto://([^?]+) ]]; then
    EMAIL=${BASH_REMATCH[1]}

    shopt -s nocasematch
    if [[ "$1" =~ subject=([^&]+) ]]; then
        SUBJECT=${BASH_REMATCH[1]}
    fi
    if [[ "$1" =~ body=([^&]+) ]]; then
        BODY=${BASH_REMATCH[1]}
    fi
    shopt -u nocasematch

    exec ${CHROME} "--app=${MAILTO}to=${EMAIL}&subject=${SUBJECT}&body=${BODY}"
fi

exec ${CHROME} --app=${APP}
