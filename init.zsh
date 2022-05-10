#!/bin/zsh

DEVICE_CONFIG_HOME="$HOME/.config"
base_path="$DEVICE_CONFIG_HOME/nvim"
lua_root="$base_path/lua"

mkdir -p $DEVICE_CONFIG_HOME/.cache/zsh
mkdir -p $lua_root/plugins
# mkdir -p $lua_root/colors


rm -rf ~/.config/nvim
rm -rf ~/.local/nvim
rm -rf ~/.cache/nvim
rm -rf ~/.config/.cache
rm -rf ~/.config/zsh

# 处理zpm缓存的问题
if [[ ! -f $HOME/.zshrc.zwc ]]; then
  rm ~/.zshrc ~/.zshrc.zwc
fi
rm -rf ~/.cache/fsh
rm -rf "${TMPDIR:-/tmp}/zsh-${UID:-user}"

cp ./.zshrc $HOME/.zshrc

# -rf 复制文件夹
cp -rf ./.config/ $DEVICE_CONFIG_HOME