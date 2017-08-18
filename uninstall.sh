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
            if [ -z "`ls -A ${line}`" ]; then
                echo "Delete folder ${line}"
                rm -r ${line}
			else
				echo "Folder not empty. ${line}"
            fi
        fi
    done
else
    echo "Record file dose not exist."
fi
