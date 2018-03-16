#!/bin/bash

# Add GoCD official
sudo echo "deb https://download.gocd.io /" | sudo tee /etc/apt/sources.list.d/gocd.list
curl -# https://download.gocd.io/GOCD-GPG-KEY.asc | apt-key add -
sudo apt-get update
# Install and set up GoCD server, agents and requirements
sudo apt-get install -y openjdk-8-jre git
sudo apt-get install -y go-agent

# Copy agent setup
sudo cp go-agent /etc/default/go-agent

# Start the agent
sudo /bin/echo "Starting GoCD Agent"
sudo /etc/init.d/go-agent start

sudo curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -
sudo apt-get install -y nodejs

# Link node
#sudo ln -s /usr/bin/nodejs /usr/bin/node


sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys 023EDB0B
echo deb https://dl.bintray.com/gauge/gauge-deb stable main | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y gauge chromium-browser libgconf-2-4 

# Remove packages no longer needed
sudoapt-get -y autoremove
