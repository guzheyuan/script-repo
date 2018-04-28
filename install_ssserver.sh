# 安装pip
yum install -y  python-setuptools && easy_install pip

# 安装ss服务
pip install shadowsocks

# 生成配置文件
echo '{"server":"0.0.0.0","port_password": {"753":"29574113"},"method": "aes-256-cfb"}' > /etc/shadowsocks.json

# 开启服务
ssserver -c /etc/shadowsocks.json -d start

# 防火墙
firewall-cmd --zone=public --add-port=753/tcp --permanent
firewall-cmd --reload
