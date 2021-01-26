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

