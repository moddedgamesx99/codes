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
echo "📢 Subscribe to my YouTube channel for more content! 👉 https://youtube.com/@mahimking11 🎥🎮"
