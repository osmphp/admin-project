#!/bin/bash

# exit if any command fails
set -e

# create .env file if it doesn't exist
if [ ! -f .env.Osm_Admin_Samples ]; then
    cp src/.env.Osm_App.template .env.Osm_App
fi
