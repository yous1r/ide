#!/bin/zsh

# DEVICE_CONFIG_HOME="$HOME/.config"
# base_path="$DEVICE_CONFIG_HOME/nvim"
# lua_root="$base_path/lua"

# mkdir -p $lua_root/plugins
# mkdir -p $DEVICE_CONFIG_HOME/.cache/zsh
# mkdir -p $lua_root/colors


rm -rf ~/.config/nvim
rm -rf ~/.local/nvim
rm -rf ~/.cache/nvim
rm -rf ~/.config/.cache

echo $(uname -s)
echo $(tput sgr0)


# -rf 复制文件夹
# cp -rf ./.config/nvim/ $base_path