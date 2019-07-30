#!/usr/bin/env bash
mkdir -p "$1"
build=$(cd "$1/" && pwd)
cd $build
wget https://www.python.org/ftp/python/3.4.5/Python-3.4.5.tgz
tar zxfv Python-3.4.5.tgz
find $build/Python-3.4.5/Python -type d | xargs chmod 0755
cd Python-3.4.5/
./configure --prefix=$build/Python-3.4.5/python
make
make install
export PATH=$build/Python-3.4.5/:$PATH
echo '****Installing pip*******'
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
export PATH=$HOME/.local/bin/:$PATH
mkdir -p $build/.profile.d
echo 'export PATH=$build/Python-3.4.5/:$HOME/.local/bin/:$PATH' > $build/.profile.d/python.sh
echo 'Testing python'
python -V
pip -V
ls -ltr $build
