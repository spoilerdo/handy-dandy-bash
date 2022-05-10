#!/bin/bash

cd PROJECT

# npm package build
if npm run build; then
    cd ../../
    cd PROJECT
    # run the front-end that includes npm package
    npm run watch
fi

