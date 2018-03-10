#!/bin/bash

read -p 'What is your project name: ' project_name
#echo $project_name

if [ ! -z "$project_name" ]
then
    if [ -x "$(command -v react-native)" ]
    then
        echo 'Creating React Native project'
        PACKAGES=( 
            prop-types
            react-navigation
            react-navigation-redux-helpers 
            react-redux
            redux
            redux-saga )

        react-native init $project_name
        cd "$project_name"
        all_packages=''
        for dep in "${PACKAGES[@]}"
        do
            all_packages="$all_packages $dep@latest"
        done
        echo "Installing all the dependencies"
        npm install $all_packages

        echo "Remove default source files"
        rm App.js
        rm index.js
        cp ../source/.babelrc .
        cp ../source/index.js .
        cp -r ../source/src .

        echo "Configure source"
        sed -i "s/RNBoilerPlate/$project_name" index.js
    else
        echo 'You dont have react native command line installed.'
    fi

else 
    echo 'You have to name your project to continue.'
fi
