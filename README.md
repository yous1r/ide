---
title: "title"
tags: vim, nvim,
author: 
---
# Neovim 现代化 IDE 配置
### zsh
- zsh 使用 zpm 管理器进行管理
1. zpm 优势
	- 快、轻量
	- 支持omz插件
	- 配置方便、支持组设置
	- 支持local、remote插件
	- 支持缓存

### Neovim

# NeoVim 2 IDE 需求分析



### 一、明确需求

​	（一）必备需求

1.   代码跳转功能
2.   代码高亮
3.   文件树功能：快捷切换文件、展开与闭合
4.   代码调试debugger
5.   代码提示功能（包括：html、css、js、ts、vue、react、solidjs、django、python）
6.   git集成（包括单行历史修改记录、文件修改记录）
7.   项目中：文件名查询、关键字查询
8.   代码格式化
9.   函数调用位置查询

​	（二）可延期需求

1.   搜索替换功能
2.   代码片段功能（snippets）
3.   终端float
4.   md预览
5.   python环境集成：配置项目虚拟环境、项目环境变量设置
6.   todoList功能
7.   一键切换配置文件
8.   折叠代码块
9.   live server

​	（三）优化项

1.   界面优化：底部状态栏、顶部面包屑、首屏界面、主题
2.   快捷键设置
3.   remote development
4.   空格、制表符格式

### 二、相应插件

1.   [【文件跳转】](https://github.com/cljoly/telescope-repo.nvim)
1.   <span style="font: italic small-caps 700 16px '微软雅黑'">暂时的认识：</span>代码跳转的实现是基于语言本身是否支持
1.   

