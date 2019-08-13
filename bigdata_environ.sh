#!/bin/bash

# instalando pacotes essenciais
sudo apt-get install build-essential aptitude tmux screen default-jre default-jdk

# baixando fontes
mkdir ~/src
cd ~/src
wget http://ftp.unicamp.br/pub/apache/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
wget https://repo.anaconda.com/archive/Anaconda2-2019.07-Linux-x86_64.sh

tar -xf spark-2.4.3-bin-hadoop2.7.tgz 
mv -fv spark-2.4.3-bin-hadoop2.7/ ~/spark

sh Anaconda2-2019.07-Linux-x86_64.sh


source ~/.bashrc

jupyter notebook --generate-config

echo "c = get_config()" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 5000" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = u'sha1:5afa1d0ebd3e:d57779f64837fcb0c44382d4ea874a52b1eeba0b'" >> ~/.jupyter/jupyter_notebook_config.py


echo "SPARK_HOME=~/spark" >> ~/.bashrc
echo "PATH=$SPARK_HOME/bin:$PATH"  >> ~/.bashrc

echo "PYSPARK_DRIVER_PYTHON=jupyter"  >> ~/.bashrc
echo "PYSPARK_DRIVER_PYTHON_OPTS='notebook'"  >> ~/.bashrc

source ~/.bashrc
