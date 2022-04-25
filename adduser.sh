# criar usuário dev
# TODO: sair no primeiro erro
export USUARIO=$1
export PUB_KEY=$2
addgroup --force-badname $USUARIO
adduser --shell /bin/bash --home /home/$USUARIO --force-badname --disabled-password --gecos "" --ingroup $USUARIO $USUARIO
usermod -a -G vagrant $USUARIO
mkdir /home/$USUARIO/.ssh
chmod 700 /home/$USUARIO/.ssh
touch /home/$USUARIO/.ssh/authorized_keys
chmod 644 /home/$USUARIO/.ssh/authorized_keys
chown -R $USUARIO:$USUARIO /home/$USUARIO/.ssh
echo $PUB_KEY >> /home/$USUARIO/.ssh/authorized_keys
echo $PUB_KEY >> /home/vagrant/.ssh/authorized_keys
echo "$USUARIO ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/usuario_dev
