#!/bin/bash
#Creation time    ：20190827
#Author           ：Huang LongPeng
#Version          ：v1_0
#Introduction     ：Install Java environment and Tomcat server
#Update time      ：

SUDO="sudo -s"
project_path=$(cd `dirname $0`; pwd)
import_war_path='/opt/tomcat8/apache-tomcat-8.5.43/webapps'

java_home='export JAVA_HOME=/opt/jdk1.8.0_221'
jre_home='export JRE_HOME=${JAVA_HOME}/jre'
classpath='export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib'
path='export PATH=${JAVA_HOME}/bin:$PATH'

main(){
  install_java_env
  install_tomcat_server
  import_war
  clear_web_env
  echo "completed"
}

install_java_env(){
  #Unzip JDK package to /opt directory
  cd ${project_path}/../web_env
  $SUDO mkdir /tmp/web_env
  $SUDO tar -zxvf web_env_install.tar.gz -C /tmp/web_env
  cd /tmp/web_env/web_env_install
  $SUDO tar -zxvf jdk-8u221-linux-x64.tar.gz -C /opt

  $SUDO echo ${java_home} >> ~/.bashrc
  $SUDO echo ${jre_home} >> ~/.bashrc
  $SUDO echo ${classpath} >> ~/.bashrc
  $SUDO echo ${path} >> ~/.bashrc	

  source ~/.bashrc
}

install_tomcat_server(){
  cd /tmp/web_env/web_env_install
  $SUDO mkdir -p /opt/tomcat8
  tar -zxvf apache-tomcat-8.5.43.tar.gz -C /opt/tomcat8	
}

import_war(){
  cd ${project_path}/../web_war
  $SUDO cp scan.war $import_war_path
}

clear_web_env(){
  $SUDO rm -r /tmp/web_env
}

main
