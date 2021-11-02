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

# build command: docker image build -t alamansky/<image-name>:latest --build-arg IMAGE_NAME=<image-name> .

# --no-cache option if GH repos are updated