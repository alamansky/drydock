# use latest node image as base image

FROM node:latest

### INSTALL BASH-IT

# install bash-it framework from github and install to /root/.bash_it

RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

# run the installation script for bash_it in silent mode (without prompts)

RUN ~/.bash_it/install.sh --silent

# change bash theme from bobby (default) to zork

RUN sed -i 's/bobby/zork/' ~/.bashrc

# delete existing files in custom bash script directory

RUN rm /root/.bash_it/custom/example.bash

# install custom bash scripts

RUN git clone https://github.com/Alamansky/bash-scripts.git /root/.bash_it/custom

### INSTALL VSCODE SERVER + EXTENSIONS

COPY /.vscode-server /root/.vscode-server

# get args

ARG PACKAGE_NAME

# set working directory to /usr/src/app

WORKDIR /usr/src/app

# download dotfiles from GIT

RUN git clone https://github.com/Alamansky/dotfiles.git /usr/src/app

COPY ./packages/${PACKAGE_NAME} /usr/src/app

# install node modules

RUN npm install

# need this for storybook to work

RUN npm i -D html-webpack-plugin@next

# install storybook

RUN npx sb init

# delete stories folder

RUN rm -rf ./src/stories

RUN mkdir /root/kickstart

COPY ./moveAllFiles.sh /usr/src/app

RUN bash ./moveAllFiles.sh

RUN rm /root/kickstart/moveAllFiles.sh

# build command: docker image build -t alamansky/eleventy:latest --build-arg PACKAGE_NAME=eleventy .

# --no-cache option if GH repos are updated