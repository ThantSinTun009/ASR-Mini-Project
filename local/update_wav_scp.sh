#!/bin/bash

set -e

RECORDINGS="/home/thant_syn/kaldi/egs/burmese_asr/recordings"

for DATA in train test; do

    INPUT="data/$DATA/wav.scp"
    OUTPUT="data/$DATA/wav.scp.new"

    if [ ! -f "$INPUT" ]; then
        echo "ERROR: $INPUT does not exist"
        continue
    fi

    > "$OUTPUT"

    while read -r UTT_ID OLD_PATH; do

        # Speaker name = everything before the first "_"
        SPEAKER="${UTT_ID%%_*}"

        # Remove Windows directory path.
        # Replace backslashes with forward slashes first.
        CLEAN_PATH="${OLD_PATH//\\//}"

        # Extract only the filename
        FILENAME="${CLEAN_PATH##*/}"

        # Construct the new Linux path
        NEW_PATH="$RECORDINGS/$SPEAKER/$FILENAME"

        echo "$UTT_ID $NEW_PATH" >> "$OUTPUT"

    done < "$INPUT"

    echo "Created $OUTPUT"

done

echo "Done!"
