FROM alpine:latest
LABEL maintainer="Antonio Pantaleo <antonio_pantaleo@icloud.com>"
LABEL org.opencontainers.image.description="This version can show hidden files and folders within nerdtree and includes more build architectures"
LABEL org.opencontainers.image.url="https://github.com/antoniopantaleo/docker-vim"
RUN apk update && apk add git curl vim
RUN curl -fLo /usr/share/vim/vim82/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN apk del curl
RUN rm /etc/vim/vimrc
WORKDIR /etc/vim
COPY . .
RUN vim -Es -u /etc/vim/vimrc -i NONE -c "PlugInstall" -c "qa"
WORKDIR /home
VOLUME /home

ENTRYPOINT [ "vim" ]
CMD [""]