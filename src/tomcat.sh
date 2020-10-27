#!/usr/bin/bash
req_tom_ver="8.5.47"
tom_m_v=$ (echo $req_tom_ver|cut -c 1)
url="http://mirrors.estointernet.in/apache/tomcat/tomcat-${tom_m_V}/v${req_tom_ver}/bin/apache-tomcat-${req_tom_ver}.tar.gz"
wget $url
tar -xvzf apache-tomcat-${req_tom_ver).tar.gz
mv apache-tomcat-${req_tom_ver} tomcats{tom_m_v}
rm -rf apache-tomcat-${req_tom_ver}.tar.gz
