#!/bin/bash

RED='\033[0;31m'
GREEN='\033[4;32m'
CLEAR='\033[0m'

echo_error() {
    echo -e "${RED}$1${CLEAR}"
    echo ""
}

echo_text() {
    echo -e "${GREEN}$1${CLEAR}"
}

install_dependencies() {
    PACKAGES=( 
        prop-types
        react-navigation
        react-navigation-redux-helpers 
        react-redux
        redux
        redux-saga )
    
    all_packages=''

    for dep in "${PACKAGES[@]}"
    do
        all_packages="$all_packages $dep@latest"
    done

    echo_text "Installing all the dependencies."
    npm install --save $all_packages
}

install_dev_dependencies() {
    DEV_DEPENDENCIES=( 
        babel-eslint
        eslint
        eslint-config-airbnb
        eslint-plugin-import
        eslint-plugin-jsx-a11y
        eslint-plugin-react )
    
    all_dev_dependencie=''

    for dep in "${DEV_DEPENDENCIES[@]}"
    do
        all_dev_dependencie="$all_dev_dependencie $dep@latest"
    done

    echo_text "Installing all the dev dependencies."
    npm install --save-dev $all_dev_dependencie
}

configure_source() {
    echo_text "Replacing default source files with boilerplate source."
    rm App.js
    rm index.js
    cp ../source/.eslintrc .
    cp ../source/index.js .
    cp -r ../source/src .
    echo "Source updated."

    echo_text "Configure source"
    sed -i.bak "s/RNBoilerPlate/$project_name/g" index.js
    rm index.js.bak # remove backup file
    echo "Source configured."
}

read -p 'What is your project name: ' project_name

if [ ! -z "$project_name" ]
then
    if [ -x "$(command -v react-native)" ]
    then
        echo_text 'Creating React Native project.'
        react-native init $project_name
        cd "$project_name"

        install_dependencies
        install_dev_dependencies
        yarn install # refresh all the dependecies
        configure_source

        echo_text "Your all sorted with your new project $project_name with boilerplate."
        pwd
        cd ..
    else
        echo_error 'You dont have react native command line installed.'
    fi

else 
    echo_error 'You have to name your project to continue.'
fi
