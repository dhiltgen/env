#!/bin/bash

for file in .*; do
    if [ "${file}" = "." ] || [ "${file}" = ".." ] ; then
        continue
    fi
    if [ -e ~/${file} ] ; then
        echo "Backing up original dot file ${file} as ${file}.orig"
        mv ~/${file} ~/${file}.orig
    fi
    ln -s $(pwd)/${file} ~/${file}
done
