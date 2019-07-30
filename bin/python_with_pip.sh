#!/usr/bin/env bash
mkdir -p "$1"
build=$(cd "$1" && pwd)
mkdir -p $build/python-all
cd $build/python-all
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar zxfv Python-3.6.9.tgz
find ./Python-3.6.9/Python -type d | xargs chmod 0755
cd Python-3.6.9
./configure --prefix $build/python-all/new_python
make
make install
export PATH=$build/python-all/Python-3.6.9:$PATH
Python -V
echo '****Installing pip*******'
wget https://bootstrap.pypa.io/get-pip.py
$build/python-all/Python-3.6.9/python get-pip.py --user
export PATH=$HOME/.local/bin/:$PATH
echo 'Testing python'
python -V
pip -V
ls -ltr $build
$build/python-all/new_python/bin/pip3 install -r $build/requirements.txt