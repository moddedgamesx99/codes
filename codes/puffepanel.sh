#!/bin/bash

# Display the banner
cat << "EOF"

___  ____ ____ ____ ____ _  _ _  _ ____    _  _ ____ ____ ___ _ _  _ ____ 
|  \ |__/ |__| | __ |  | |\ | |\/| |       |__| |  | [__   |  | |\ | | __ 
|__/ |  \ |  | |__] |__| | \| |  | |___    |  | |__| ___]  |  | | \| |__] 
                                                                          
 
                                                          
EOF

echo "🚀 Updating system packages..."
apt update

echo "🔧 Installing required packages..."
apt install -y sudo
apt install -y systemctl

echo "🌐 Adding DragonMC Hosting repository..."
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh?any=true | sudo bash

echo "📦 Updating package list..."
sudo apt update

echo "🎮 Installing DragonMC Hosting..."
sudo apt-get install -y DragonMC Hosting

echo "👤 Creating a DragonMC Hosting user..."
sudo DragonMC Hosting user add

echo "✅ Enabling and starting DragonMC Hosting service..."
sudo systemctl enable --now DragonMC Hosting

echo "🔥 DragonMC Hosting is installed and running!"

