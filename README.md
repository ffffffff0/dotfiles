## dotfiles

确保vim版本>=8.1 

- vim
vim 配置

- ideavimrc
  IDEA vim 插件配置

- settings.json

  vscode vim 配置

### 使用方法

运行如下命令:

`make init`

建立vimrc的映射，然后在vim中输入`:PlugInstall` 安装插件

- coc.vim 设置
Make sure use vim >= 8.1.1719 or neovim >= 0.4.0 and Install nodejs >= 14.14:

首先安装coc插件支持lsp

```
:CocInstall coc-json coc-tsserver
```

输入`:CocConfig` 来打开coc配置文件 coc-setting.json

- LeaderF 设置

需要vim支持python和global tags



