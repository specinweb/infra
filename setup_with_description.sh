#!/bin/bash
#gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=setup.sh reddit-app2

#ssh appuser@35.241.142.13

# Install Ruby

# Устанавливаем RVM
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

# Подгружаем RVM скрипт и устанавливаем зависимости для работы RVM и Ruby
source ~/.rvm/scripts/rvm
rvm requirements

# Устанавливаем Ruby (версии 2.4.1)
rvm install 2.4.1

# Версия руби для пользователя по умолчанию
rvm use 2.4.1 --default

# Установливаем bundler для управления зависимостями нашего приложения
gem install bundler -V --no-ri --no-rdoc

# Проверяем версии установленных Ruby и Bundler
ruby -v
bundle -v

# ========================================================================

# Install MongoDB

# Добавляем ключи и ссылку на репозиторий
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

# Обновим индекс доступных пакетов и установим нужный пакет
sudo apt-get update
sudo apt-get install -y mongodb-org --allow-unauthenticated

# Запускаем MongoDB
sudo systemctl start mongod

# Добавляем в автозапуск
sudo systemctl enable mongod

# Проверяем статус
sudo systemctl status mongod

# ========================================================================

# Deploy

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma

