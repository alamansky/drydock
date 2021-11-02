### INSTALL VSCODE SERVER + EXTENSIONS

# set working directory to /usr/src/app

COPY ./vscode-server.tar.gz /root

RUN tar -xpzf /root/vscode-server.tar.gz -C /root

RUN rm /root/vscode-server.tar.gz

