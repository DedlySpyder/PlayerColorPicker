#!/bin/bash

TARGET_DIR="./lua"

# This script will save all of the files found in the given TTS Lua directory to the TARGET_DIR directory
# The TTS Lua directory can either be set as an environment variable or provided as an argument to this script
#	export TTS_TEMP_LUA_DIR="/path/to/dir" # In your .bash_profile/.profile
#	./save_mod_files.sh
#		--or--
#	./save_mod_files.sh "/path/to/dir"


TEMP_DIR="$1"

if [[ X"$TEMP_DIR" == X ]] && [[ X"$TTS_TEMP_LUA_DIR" != X ]]; then
	TEMP_DIR="$TTS_TEMP_LUA_DIR"
fi

if [[ X"$TEMP_DIR" == X ]]; then
	echo "Usage: $0 [tts lua temp dir]"
	echo "		 Alternatively, the directory can be set with an ENV variable called TTS_TEMP_LUA_DIR"
	exit 1
fi

if [[ "${TEMP_DIR: -1}" != "/" ]]; then
	TEMP_DIR="${TEMP_DIR}/"
fi

rsync -av "$TEMP_DIR" "$TARGET_DIR"
