cd ~

if [ -f .vimrc ];
then
    mv .vimrc .vimrc.bak
fi

echo 'set runtimepath+=~/.vimcfg
source ~/.vimcfg/config.vim
' > ~/.vimrc

echo 'Vimcfg instalado correctamente'
