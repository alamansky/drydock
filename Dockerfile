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

# set working directory to /usr/src/app

COPY ./vscode-server.tar.gz /root

RUN tar -xpzf /root/vscode-server.tar.gz -C /root

RUN rm /root/vscode-server.tar.gz

# get args

ARG IMAGE_NAME

# set working directory to /usr/src/app

WORKDIR /usr/src/app

# copy script to root folder (no files can be present in `/usr/src/app` prior to cloning a Git repo there)

COPY ./images/${IMAGE_NAME}/setupScripts/getExternalFiles.sh /root

# get tooling boilerplate from Github repo, install to `/usr/src/app`

RUN bash /root/getExternalFiles.sh

# remove script from root folder

RUN rm /root/getExternalFiles.sh

# copy project files from local dir to `/usr/src/app` (this is a safe operation since the Git repo has already been cloned)

COPY ./images/${IMAGE_NAME} /usr/src/app

# install node modules

RUN npm install

# do any post-`npm install` setup, e.g. configure storybook

RUN bash ./setupScripts/runInsideContainer.sh

# remove setup scripts

RUN rm -rf ./setupScripts

# create a temp folder in /root

RUN mkdir /root/kickstart

# copy script into container for moving files from `/usr/src/app` to `/root/kickstart`

COPY ./moveAllFiles.sh /usr/src/app

# run script

RUN bash ./moveAllFiles.sh

# delete script

RUN rm /root/kickstart/moveAllFiles.sh