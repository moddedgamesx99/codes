#!/bin/bash

# Display the banner
cat << "EOF"
███╗   ███╗ █████╗ ██╗  ██╗██╗███╗   ███╗ ██████╗ ██████╗ 
████╗ ████║██╔══██╗██║  ██║██║████╗ ████║██╔═══██╗██╔══██╗
██╔████╔██║███████║███████║██║██╔████╔██║██║   ██║██████╔╝
██║╚██╔╝██║██╔══██║██╔══██║██║██║╚██╔╝██║██║   ██║██╔═══╝ 
██║ ╚═╝ ██║██║  ██║██║  ██║██║██║ ╚═╝ ██║╚██████╔╝██║     
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝     
                                                          
EOF

##############################################
#           PufferPanel Installation         #
##############################################

echo "🚀 Updating system packages..."
apt update

echo "🔧 Installing required packages..."
apt install -y sudo
apt install -y systemctl

echo "🌐 Adding PufferPanel repository..."
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh?any=true | sudo bash

echo "📦 Updating package list..."
sudo apt update

echo "🎮 Installing PufferPanel..."
sudo apt-get install -y pufferpanel

echo "👤 Creating a PufferPanel user..."
sudo pufferpanel user add

echo "✅ Enabling and starting PufferPanel service..."
sudo systemctl enable --now pufferpanel

echo "🔥 PufferPanel is installed and running!"

##############################################
#           Hydra Panel Installation         #
##############################################

echo "🚀 Cloning the Hydra panel repository..."
git clone https://github.com/hydralabs-beta/panel

echo "🔄 Renaming 'panel' directory to 'hydra'..."
mv panel hydra

echo "📂 Changing directory to 'hydra'..."
cd hydra || { echo "Failed to change directory to hydra"; exit 1; }

echo "📦 Installing Node dependencies..."
npm install

echo "🌱 Seeding the database..."
npm run seed

echo "👤 Creating a new user..."
npm run createUser

echo "🚀 Starting the Hydra panel..."
node .

##############################################
#           Final Message                    #
##############################################

echo "📢 Don't forget to subscribe to my YouTube channel for more content! 👉 https://youtube.com/@mahimking11 🎥🎮"
