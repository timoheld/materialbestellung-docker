#!/bin/bash
while true; do
    flask db migrate
    flask db upgrade
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo Upgrade command failed, retrying in 5 secs...
    sleep 5
done
gunicorn -w 4 -b 0.0.0.0:5000 materialbestellung:app
