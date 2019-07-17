#! /bin/bash 
#curl https://www.python.org/ftp/python/3.5.7/Python-3.5.7.tgz -o Python-3.5.7.tgz
#md5check=md5sum Python-3.5.7.tgz | awk '{print $1}'
#if [ ${md5check} == '92f4c16c55429bf986f5ab45fe3a6659' ];
#   echo "下载的包完整！进入安装python3过程。。。"
#else
#   echo "注：安装包不完整，请检查！"
#   echo "本脚本退出执行！"
#   exit
#fi

customize_port="8082"
customize_password="zhouxiaoshuai"

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

which pip > /dev/null
if [ $? -eq 0 ];then
   echo "pip命令存在，可以进行下一步！"
else
   echo "pip命令安装可能失败，请检查！"
   echo "本脚本退出。"
   exit
fi

pip install --upgrade pip
pip install shadowsocks
cat << EOF > /etc/shadowsocks.json
{
  "server": "0.0.0.0",
  "local_address": "127.0.0.1",
  "local_port": 1080,
  "port_password": {
    "8080": "Nishuaishuai",
    "${customize_port}": "${customize_password}"
  },
  "timeout": 600,
  "method": "aes-256-cfb"
}
EOF

cat << EOF > /etc/systemd/system/shadowsocks.service
[Unit]
Description=Shadowsocks

[Service]
TimeoutStartSec=0
ExecStart=/usr/bin/ssserver -c /etc/shadowsocks.json

[Install]
WantedBy=multi-user.target
EOF


systemctl enable shadowsocks
systemctl start shadowsocks
#firewall-cmd --zone=public --add-port=8080/tcp --permanent
#firewall-cmd --zone=public --add-port=8081/tcp --permanent
#firewall-cmd --reload

cat /etc/redhat-release 

yum update
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y

egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
grub2-set-default 0
cat << EOF >> /etc/sysctl.conf 
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
EOF
echo "重启系统！！！！"
sleep 3
sync;reboot

#sysctl net.ipv4.tcp_available_congestion_control
#lsmod | grep bbr


reboot
