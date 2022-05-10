#!/bin/zsh

DEVICE_CONFIG_HOME="$HOME/.config"
base_path="$DEVICE_CONFIG_HOME/nvim"
tmux_config="$DEVICE_CONFIG_HOME/tmux"

mkdir -p $DEVICE_CONFIG_HOME/tmux

rm -rf ~/.config/tmux

# -rf 复制文件夹
cp -rf ./.config/tmux/ $tmux_config