一
#!/bin/bash

i=1
while [ $i -le 1 ]
do
firefox http://server0.example.com/

done
二
#!/bin/bash
for i in {1..20}
do
if [ $i -lt 10   ];then
useradd ceshi0$i
else
useradd ceshi$i
fi
done
三
#!/bin/bash
a=0
for i in $(find /usr/share/doc/* -type f)
do
file $i -l |egrep text
if [ $? -eq 0   ];then
ssum=$(egrep -c  '.|^$' $i )
let sum+=ssum
let a++
fi
done
echo "一共统计了 $a 个文件，累计总行数 $sum 行"
四
#!/bin/bash
if [ $# -eq 0  ];then
echo $0 域名
exit 1
fi
egrep -i  ".*servername.*$1.*" /etc/httpd/conf.d/vhosts.conf >>/dev/null
if [ $? -eq 0 ];then
echo "虚拟主机"$1"已经存在"
exit 2
else
echo "</VirtualHost *:80>
documentroot /var/www/FQDN
servername $1
<virtualHost>" >> /etc/httpd/conf.d/vhosts.conf
echo "172.25.0.11 $1" >> /etc/hosts
echo "创建成功"
fi
五
#!/bin/bash
for i in $(cat /root/ip.txt)
do
expect <<EOF
spawn ssh -o StrictHostKeyChecking=no  $i
expect "password:" {send "redhat"}
expect "#" {send "wget -O /tmp/a.html http://sever0.example.cm/a.html\r"}
#expect "#" {send "echo a.txtalala >> /tmp/a.html \r "}
expect "#" {send "exit\r"}
EOF
done

