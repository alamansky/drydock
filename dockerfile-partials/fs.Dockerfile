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