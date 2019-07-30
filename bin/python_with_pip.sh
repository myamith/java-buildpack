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
wget https://bootstrap.pypa.io/get-pip.py
#python get-pip.py --user
#export PATH=$HOME/.local/bin/:$PATH
ls -ltr $build
mkdir -p $build/.profile.d
echo 'export PATH=/app/python-all/Python-3.6.9:/app/usr/local/bin:$PATH' > $build/.profile.d/python.sh
echo 'python /app/python-all/Python-3.6.9/get-pip.py --user' >> $build/.profile.d/python.sh
echo 'export PATH=$HOME/.local/bin/:$PATH' >> $build/.profile.d/python.sh
echo 'mkdir -p /tmp/app/python-all/new_python/bin && ln -s /app/python-all/new_python/bin/python3.6 /tmp/app/python-all/new_python/bin/python3.6' >> $build/.profile.d/python.sh
echo 'export PYTHONPATH="${PYTHONPATH}:/app/python-all/new_python/lib/python3.6/site-packages"' >> $build/.profile.d/python.sh
echo 'pip install -r /app/requirements.txt' >> $build/.profile.d/python.sh

