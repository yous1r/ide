#!/bin/zsh

DEVICE_CONFIG_HOME="~/.config"
base_path="$DEVICE_CONFIG_HOME/nvim"
lua_root="$base_path/lua"

dirArray=(~/.config/nvim ~/.local/nvim ~/.cache/nvim ~/.config/.cache ~/.config/zsh)

mkdir -p $DEVICE_CONFIG_HOME/.cache/zsh
mkdir -p $lua_root/plugins
mkdir -p $lua_root/colors

for dir ($dirArray) {
    if [[ -d $dir ]] {
      rm -rf $dir
      echo `$dir removed`
    }
}
echo "neovim cache cleaned!!!"

# 处理zpm缓存的问题
zshConfig=(~/.zshrc.zwc ~/.zshrc)
for config ($zshConfig) {
  if [[ -f $config ]] {
    rm -rf $config
  }
}
echo "zpm cache cleaned!!!"


if [[ -d ~/.cache/fsh ]] {
  rm -rf ~/.cache/fsh
  rm -rf ${TMPDIR:-/tmp}/zsh-${UID:-user}
  echo "fsh cache cleaned!!!"
}

cp ./.zshrc ~/.zshrc

# -rf 复制文件夹
cp -r ./.config/. $DEVICE_CONFIG_HOME