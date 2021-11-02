#!/bin/sh

# install storybook npm package and init (must specify webpack version in arg)

npx sb@next init --builder webpack5

# delete stories folder; story files will reside in component folder

rm -rf ./src/stories