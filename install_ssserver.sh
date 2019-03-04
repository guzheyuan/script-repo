# 安装pip
yum install -y  python-setuptools && easy_install pip

# 安装wget
yum install wget -y

# 换源centos7
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum makecache

# 安装libsodium
yum install epel-release -y
yum install -y yum-utils && yum-config-manager --enable epel
yum install libsodium -y

# 安装ss服务
pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U

# 生成配置文件
echo '{"server":"0.0.0.0","port_password": {"5081":"xxxxxxxxx"},"method": "chacha20-ietf-poly1305"}' > /etc/shadowsocks.json

# 开启服务
ssserver -c /etc/shadowsocks.json -d start

# 防火墙
firewall-cmd --zone=public --add-port=753/tcp --permanent
firewall-cmd --reload

# 开机自启动
vi /etc/systemd/system/shadowsocks.service

[Unit]
Description=Shadowsocks

[Service]
TimeoutStartSec=0
ExecStart=/usr/bin/ssserver -c /etc/shadowsocks.json

[Install]
WantedBy=multi-user.target

# 启用开机自启动
systemctl enable shadowsocks
systemctl start shadowsocks
