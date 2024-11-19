export SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export ORANGE='\033[0;33m'
export YELLOW='\033[1;33m'
export NC='\033[0m'
clear
echo -e "${RED}[Warning]${NC} ${YELLOW}This script will install a fully working NixOS system with Gnome as the Desktop Environment. It is intended to be used on a fresh installation made from the NixOS-Gnome iso image. If you have installed NixOS with another way, be aware that this script might not work or work partially.${NC}"
echo

echo -e "Do you want to launch the script ? Press ${GREEN}y${NC} key to confirm or any other key to cancel."
echo
read -p "answer: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
clear
else
clear
echo -e "${RED}Script canceled${NC}"
[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo -e "${RED}do you want to make a backup of /etc/nixos ?${NC} Press ${GREEN}y${NC} key to confirm or any other key to skip."
echo
read -p "answer: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
clear
sudo mkdir -p ~/backup
sleep 0.1
sudo cp -r /etc/nixos/* ~/backup
clear
echo -e "${GREEN}backup created successfully in your home directory.${NC}"
echo
else
clear
echo -e "${ORANGE}skipping${NC}"
echo
fi

echo -e "Do you want to replace the configuration.nix file ? ${RED}It will erase /etc/nixos/ content!${NC} Press ${GREEN}y${NC} key to confirm or any other key to skip."
echo
read -p "answer: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
clear
sudo rm -rf /etc/nixos/*
sleep 0.1
sudo cp -r $SCRIPTPATH/configuration.nix /etc/nixos/
sudo cp -r $SCRIPTPATH/configs/ /etc/nixos/
echo -e "${GREEN}configuration.nix replaced.${NC}"
sleep 0.5
sudo nixos-generate-config
echo
else
clear
echo -e "${ORANGE}skipping${NC}"
echo
fi

echo -e "Do you want to enable the home-manager service ? Press ${GREEN}y${NC} key to confirm or any other key to skip."
echo
read -p "answer: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
clear
sudo cp -r $SCRIPTPATH/flake.nix /etc/nixos/
sudo cp -r $SCRIPTPATH/home.nix /etc/nixos/
echo -e "${GREEN}home-manager service ready to be enabled.${NC}"
echo
else
clear
echo -e "${ORANGE}skipping${NC}"
echo
fi

echo -e "You can now run the following command to apply the changes: ${GREEN}sudo nixos-rebuild switch --flake /etc/nixos/${NC} or ${GREEN}nixos-rebuild switch${NC} if you didn't took the home-manager option."
echo
echo -e "If you want to test it first run: ${GREEN}sudo nixos-rebuild dry-build --flake /etc/nixos/${NC} or ${GREEN}nixos-rebuild dry-build${NC} if you didn't took the home-manager option."
echo
echo -e "${RED}Do not forget to copy your backup and the current config to an external drive or USB key!${NC}"
echo
echo "One last thing, a little quote for you: If you were any dumber i'd have to water you once a day. Now go learn NixOS by yourself!"
echo
