#!/bin/bash
#Creation time    ：20190905
#Author           ：Huang LongPeng
#Version          ：v1_0
#Introduction     ：compile scan_cpp_code
#Update time      ：

SUDO="sudo -s"
project_path=$(cd `dirname $0`; pwd)
src_target_path='/usr/local/share/starnet/scan/'

main(){
  compile
  clear_scan_code
  echo "completed"
}

compile(){
  cd ${project_path}/../../scan_code/cpp_code
  $SUDO mkdir -p /tmp/scan_code/
  $SUDO tar -zxvf src.tar.gz -C /tmp/scan_code/ 
  cd /tmp/scan_code/src
  $SUDO rm -r build 
  $SUDO mkdir build
  cd build
  $SUDO cmake ../
  $SUDO make	
  $SUDO cp src $src_target_path
}

clear_scan_code(){
  $SUDO rm -r /tmp/scan_code
}

main
