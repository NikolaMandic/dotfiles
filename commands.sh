sudo apt-get install python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install gcc-arm-linux-gnueabi
sudo apt-get install qemu-user-static
sudo apt-get install gdb-multiarch
sudo apt-get install git
git clone https://github.com/NikolaMandic/diskotek.git
sudo apt-get install nodejs

sudo apt-get install vim-nox

cd .vim/bundle/
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/Shutnik/jshint2.vim
git clone https://github.com/Lokaltog/vim-easymotion
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/chrisbra/histwin.vim
git clone https://github.com/msanders/snipmate.vim
git clone git://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/Shougo/neocomplcache.vim
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/fholgado/minibufexpl.vim
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-get update
sudo apt-get install opera

