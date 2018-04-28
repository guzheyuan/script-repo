echo -e "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/7/\$basearch/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/nginx.repo

yum install -y nginx
