#!/bin/bash

read -p 'What is your project name: ' project_name
#echo $project_name

if [ ! -z "$project_name" ]
then
    if [ -x "$(command -v react-native)" ]
    then
        echo 'Creating React Native project.'
        PACKAGES=( 
            prop-types
            react-navigation
            react-navigation-redux-helpers 
            react-redux
            redux
            redux-saga )

        DEV_DEPENDENCIES=( 
            babel-eslint
            eslint
            eslint-config-airbnb
            eslint-plugin-import
            eslint-plugin-jsx-a11y
            eslint-plugin-react )

        react-native init $project_name
        pushd "$project_name"
        all_packages=''
        for dep in "${PACKAGES[@]}"
        do
            all_packages="$all_packages $dep@latest"
        done
        echo "Installing all the dependencies."
        npm install --save $all_packages

        all_dev_dependencie=''
        for dep in "${DEV_DEPENDENCIES[@]}"
        do
            all_dev_dependencie="$all_dev_dependencie $dep@latest"
        done
        echo "Installing all the dev dependencies."
        npm install --save-dev $all_dev_dependencie

        echo "Replace default source files with boilerplat source."
        rm App.js
        rm index.js
        cp ../source/.babelrc .
        cp ../source/index.js .
        cp -r ../source/src .

        echo "Configure source"
        sed -i.bak "s/RNBoilerPlate/$project_name/g" index.js
        rm index.js.bak # remove backup file

        yarn install # refresh all the dependecies
        popd

        echo "Your all sorted with your new project $project_name with boilerplate."

    else
        echo 'You dont have react native command line installed.'
    fi

else 
    echo 'You have to name your project to continue.'
fi
