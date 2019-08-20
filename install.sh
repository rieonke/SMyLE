#!/usr/bin/env bash
# -*- tab-width: 4; encoding: utf-8 -*-
echo "[SMyLE] Removing ~/.smyle"
if [ -d ~/.smyle ]
then
    rm -rf ~/.smyle
fi

git clone https://github.com/rieonke/SMyLE.git ~/.smyle

if ! type jq > /dev/null
 
then
	echo "[SMyLE] Installing jq"
	if type brew > /dev/null
	then
		brew install jq
	elif type apt-get > /dev/null
	then
		sudo apt-get install -y jq

	elif type yum > /dev/null
	then
		sudo yum install -y yum
	elif type dnf > /dev/null
	then
		sudo dnf install -y jq
	fi
fi


use_alias=1
echo "[SMyLE] Would you like to use alias? [Y/n]: \c"
read line
if [ "$line" = "Y" ] || [ "$line" = "y" ] || [ -z "$line" ]; then
    use_alias=1
else
    use_alias=0
fi


if [ -f ~/.zshrc ]
then
    if [ $(grep "source ~/.smyle/smyle.sh" ~/.zshrc | wc -l) -eq 0 ]
    then
        echo "export SMYLE_USE_ALIAS=${use_alias}\nsource ~/.smyle/smyle.sh" >> ~/.zshrc
    fi
fi

if [ -f ~/.bashrc ]
then
    if [ $(grep "source ~/.smyle/smyle.sh" ~/.bashrc | wc -l) -eq 0 ]
    then
        echo "export SMYLE_USE_ALIAS=${use_alias}\nsource ~/.smyle/smyle.sh" >> ~/.bashrc
    fi
fi

echo "[SMyLE] Done."

