sudo mkdir -p /etc/calamares/
cd calamares-conf/
sudo install -Dm644 ./calamares/ /etc/calamares/
sudo apt install -y calamares qml-module-qtquick-controls
sudo calamares -d