#!/bin/bash

# Define the app name + PR number
APP_NAME="fly-astro-pr-$1"

# Check if the app already exists
if flyctl apps list | grep -q $APP_NAME; then
    # If the app exists, deploy to it
    echo "App $APP_NAME already exists, deploying..."
    flyctl deploy --app=$APP_NAME --remote-only
else
    # If the app doesn't exist, launch it
    echo "Launching new app $APP_NAME..."
    flyctl launch --name=$APP_NAME --copy-config -y
fi