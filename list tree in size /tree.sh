#!/bin/bash

tree -h --du -s | awk '{ 
    size = $4;
    unit = $5;
    if (unit == "") {
        if (size >= 1048576) {
            printf "%6.2f GB  %s\n", size/1073741824, $0;
        } else if (size >= 1024) {
            printf "%6.2f MB  %s\n", size/1048576, $0;
        } else {
            print $0;
        }
    } else {
        print $0;
    }
}'
