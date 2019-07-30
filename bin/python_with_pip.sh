#!/usr/bin/env bash
mkdir -p "$1"
build=$(cd "$1/" && pwd)
cd $build
wget https://www.python.org/ftp/python/3.4.5/Python-3.4.5.tgz
tar zxfv Python-3.4.5.tgz
find ~/filename/python -type d | xargs chmod 0755
cd Python-3.4.5/
./configure --prefix=$HOME/filename/python
make
make install
export PATH=$HOME/filename/python/Python-3.4.5/:$PATH

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
export PATH=$HOME/.local/bin/:$PATH
python -V
mkdir -p $build/.profile.d
echo 'export PATH=$PATH:$HOME/filename/python/Python-3.4.5:$HOME/.local/bin' > $build/.profile.d/python.sh

