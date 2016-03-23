#! /bin/bash
#
######################################################################################################
## 1.Télécharger le script																			##
##		wget https://raw.githubusercontent.com/Zackk45/Linux/master/installation/install.sh 		##
##		wget https://raw.githubusercontent.com/Zackk45/Linux/master/installation/archive.tar.xz 	##
## 2.Le rendre éxecutable																			##
##		chmod +x ./install.sh																		##
## 3.L'éxecuter																						##
##		./install.sh																				##
######################################################################################################

cd $HOME

#Installation de l'environnement graphique openbox + outils
sudo apt-get install - y xorg openbox xinit pcmanfm chromium-browser terminator notify-osd libnotify-bin numlockx
sudo apt-get update
sudo apt-get install - y libc-dev-bin libc6-dev linux-libc-dev manpages manpages-fr manpages-fr-extra manpages-fr-dev manpages-dev manpages-posix-dev xscreensaver xscreensaver-data ibus ibus-gtk ibus-gtk3 libibus-1.0 poppler-utils wkhtmltopdf
sudo apt-get update
sudo apt-get install - y lubuntu-restricted-addons lubuntu-restricted-extras linux-firmware-nonfree
sudo apt-get update

#Installation de logiciel complémentaire
sudo apt-get install - y obconf lxappearance obmenu xarchiver alsa-utils gnome-alsamixer wicd menu menu-xdg gnome-menus openbox-xdgmenu gpicview cups gparted
sudo apt-get update
sudo apt-get install - y elementary-icon-theme nitrogen conky plank tint2 gufw compton deborphan synaptic apturl gdebi htop gmrun
sudo apt-get update
sudo apt-get install - y vim scrot gpicview evince gedit gksu vlc lubuntu-software-center language-selector-gnome tree ppa-purge git libreoffice-common
sudo apt-get update

#Instatallation de codec vidéo/audio + format de compression
sudo apt-get install - y unace rar unrar unar p7zip-rar p7zip zip unzip arj libuu0 mpack sharutils uudeview gstreamer0.10-plugins-ugly gxine libdvdread4 icedax tagtool easytag id3tool lame libmad0 mpg321 libavcodec-extra xz-utils
sudo apt-get update

#Installation du microcode pour les processeurs intel
sudo apt-get install - y intel-microcode
sudo apt-get update

#Gestion de l'énergie, ajout du dépôt et installation
sudo apt-add-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install - y tlp tlp-rdw
sudo apt-get update
sudo apt-get remove --purge network-manager-gnome
sudo apt-get update

#Ajout de l'utilisateur aux groupe audio pour faire fonctionner le son et netdev pour internet
sudo adduser $USER audio
sudo adduser $USER netdev

#Ne plus demander le mot de passe root pour éteindre ou redémarrer
sudo chmod +s /sbin/telinit

#Téléchargement des fichiers de configuration
wget https://raw.githubusercontent.com/Zackk45/Linux/master/installation/archive.tar.xz
tar -xvJf archive.tar.xz
chown -Rc 1000:1000 $HOME

#Téléchargement du projet obuntu pour s'inspirer
wget http://cigeekchoops.free.fr/obuntu/obuntu.tar.gz
mv -v obuntu.tar.gz $HOME/Téléchargements

#Meilleur gestion du swap et de la mémoire
echo vm.swappiness=5 | sudo tee /etc/sysctl.d/99-swappiness.conf
echo vm.vfs_cache_pressure=50 | sudo tee -a /etc/sysctl.d/99-swappiness.conf
sudo sysctl -p /etc/sysctl.d/99-swappiness.conf

#Mise à jour, nettoyage du système et redémarrage
sudo apt-get dist-upgrade
sudo apt-get autoremove
telinit 6
exit 0

#Modifier la méthode d'entré au clavier (gksudo ibus-setup) ainsi que la langue (gksudo /usr/bin/gnome-language-selector)
