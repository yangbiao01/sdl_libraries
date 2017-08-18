#!/bin/bash

RECORD_FILE="install_record.txt"

if [ -f $RECORD_FILE ]; then
    cat $RECORD_FILE | while read line
    do
        if [ -f ${line} ]; then
            echo "Delete file ${line}"
            rm ${line}
        fi

        if [ -d ${line} ]; then
            echo "Folder: ${line}"
            if [ `ls -A ${line}|wc -w` ]; then
                echo "Delete folder ${line}"
                rm -r ${line}
            fi
        fi
    done
else
    echo "Record file dose not exist."
fi
