#!/bin/bash
sudo -u "user" -i <<EOF
	sed -i "s/ZSH_THEME=\".*\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g" ~/.zshrc
EOF
