# dotfiles

我的配置文件备份，覆盖日常开发环境。

## 目录

| 配置 | 路径 | 说明 |
|------|------|------|
| **Vim** | `vimrc` `vim/` | Vim 配置及插件（vim-airline, vim-surround, vim-floaterm 等） |
| **Neovim** | `vim/` | Neovim 配置（同 Vim 共用） |
| **VS Code** | `settings.json` `keybindings.json` | VS Code Vim 插件配置 |
| **IDEA Vim** | `.ideavimrc` | JetBrains IDE Vim 插件配置 |
| **Zed** | `zed/` | Zed 编辑器配置（Dracula Soft 主题、Vim 键位、UI 精简） |
| **tmux** | `tmux.conf` | tmux 终端复用器配置 |

## 安装

```bash
# Vim / Neovim（自动创建软链接）
make init

# Zed（手动复制）
cp zed/settings.json ~/.config/zed/
cp zed/keymap.json ~/.config/zed/
mkdir -p ~/.config/zed/themes
cp zed/themes/dracula-soft.json ~/.config/zed/themes/
```

Vim 插件首次使用需安装：

```vim
:PlugInstall
:CocInstall coc-json coc-tsserver
```

## 系统要求

- Vim ≥ 8.1
- Node.js ≥ 14.14（coc.nvim）
