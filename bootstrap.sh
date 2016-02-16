#Cleaning some stuff
echo "----Updating packages before doing anything----"
sudo apt-get update -y

echo "----Installing Git----"
sudo apt-get install -y git gitk git-gui

echo "----Installing some dependencies----"
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

echo "----Installing rbenv----"
cd
git clone git://github.com/sstephenson/rbenv.git /home/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/.bashrc

git clone git://github.com/sstephenson/ruby-build.git /home/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/.bashrc
source /home/.bashrc

echo "----Install Ruby----"
rbenv install -v 2.2.3
rbenv global 2.2.3
ruby -v

echo "----Additional Config----"
echo "gem: --no-document" > ~/.gemrc
gem install bundler

echo "----Installing Rails----"
gem install rails
rbenv rehash
rails -v

echo "----Installing Node.js----"
sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update -y
sudo apt-get install -y nodejs

echo "----Installing Phantom.js"
sudo apt-get install -y build-essential chrpath libssl-dev libxft-dev
sudo apt-get install -y libfreetype6 libfreetype6-dev
sudo apt-get install -y libfontconfig1 libfontconfig1-dev
sudo apt-get install -y bzip2

cd ~
export PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
sudo tar xvjf $PHANTOM_JS.tar.bz2
sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
phantomjs --version

#echo "----Installing Database----"
#sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
#gem install mysql2

echo "Successfully Installed Have Fun!!!"