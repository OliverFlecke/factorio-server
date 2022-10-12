#!/bin/sh
echo "v1.0"
echo "Generating config files..."

cp /factorio/settings/map-settings.json /factorio/map-settings.json

envsubst '${SERVER_NAME},${SERVER_DESCRIPTION},${USERNAME},${PASSWORD},${TOKEN},${SERVER_PASSWORD}' < /factorio/settings/server-settings.json > /factorio/server-settings.json
envsubst '${PEACEFUL_MODE}' < /factorio/settings/map-gen-settings.json > /factorio/map-gen-settings.json
envsubst '${ADMIN_NAME}' < /factorio/settings/server-adminlist.json > /factorio/server-adminlist.json

echo "\e[1;32mConfig files generation done"
echo "\e[1;32mChecking for save file..."

save_file=/factorio/saves/current_game.zip
if [ ! -f "$save_file" ]
then
	echo "\e[1;32mSave file not found - creating new"
	./new_game.sh
	echo "\e[1;32mCreating new game file done"
else
	echo -n "\e[1;32mSave file found. Last modified at: "
	date -r $save_file
fi

echo "\e[1;32mStarting server..."
./start_server.sh
