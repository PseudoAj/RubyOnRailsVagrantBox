#!/usr/bin/env bash

#Cleaning some stuff
echo "----Updating packages before doing anything----"
apt-get update -y

echo "----Installing Git----"
apt-get install -y git gitk git-gui

echo "----Installing some dependencies----"
apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

echo "----Installing rbenv----"
sudo -u vagrant git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
sudo -u vagrant echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.profile
sudo -u vagrant echo 'eval "$(rbenv init -)"' >> /home/vagrant/.profile
sudo -u vagrant git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

echo "----Install Ruby----"
sudo -u vagrant -i rbenv install -v 2.2.3
sudo -u vagrant -i rbenv global 2.2.3
sudo -u vagrant -i ruby -v

echo "----Additional Config----"
sudo -u vagrant echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc

echo "----Installing Rails----"
sudo -u vagrant -i gem install rails
sudo -u vagrant -i rbenv rehash
sudo -u vagrant -i rails -v

echo "----Installing Node.js----"
apt-get install -y software-properties-common python-software-properties
add-apt-repository ppa:chris-lea/node.js
apt-get update -y
apt-get install -y nodejs

echo "----Installing Phantom.js"
apt-get install -y build-essential chrpath libssl-dev libxft-dev
apt-get install -y libfreetype6 libfreetype6-dev
apt-get install -y libfontconfig1 libfontconfig1-dev
apt-get install -y bzip2

cd ~
export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
tar xvjf $PHANTOM_JS.tar.bz2
mv $PHANTOM_JS /usr/local/share
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
phantomjs --version

#echo "----Installing Database----"
#sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
#gem install mysql2

echo "Successfully Installed Have Fun!!!"