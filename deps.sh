# instalar dependências
add-apt-repository ppa:ondrej/php
apt-get update
apt-get upgrade
apt-get install -y \
  bash-completion \
  vim \
  git \
  php7.4 \
  php7.4-common \
  php7.4-mcrypt \
  php7.4-zip \
  php7.4-intl \
  php7.4-mbstring \
  php7.4-pgsql \
  apache2 \
  libapache2-mod-php7.4 \
  zip \
  unzip
a2enmod rewrite
systemctl reload apache2

