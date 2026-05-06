# Zed 配置备份

## 文件

| 文件 | 说明 |
|------|------|
| `settings.json` | 编辑器设置（主题、字体、Vim、布局等） |
| `keymap.json` | 自定义快捷键（Vim 模式下的 leader 键映射） |
| `themes/dracula-soft.json` | Dracula Soft 主题 |

## 关键设置一览

- **主题** → Dracula Soft（暗色）
- **字体** → FiraCode Nerd Font Propo, 16.5px
- **Vim 模式** → 开启，系统剪贴板
- **Minimap** → 关闭
- **滚动条** → auto（有冲突/改动时显示彩色标记）
- **Breadcrumbs** → 关闭（编辑器顶部导航条）
- **快速操作按钮** → 关闭
- **相对行号** → 开启

## 安装

```bash
# 1. 复制配置文件
cp settings.json ~/.config/zed/
cp keymap.json ~/.config/zed/

# 2. 安装主题
mkdir -p ~/.config/zed/themes
cp themes/dracula-soft.json ~/.config/zed/themes/

# 3. 重启 Zed
```

## 来源

从 macOS `~/.config/zed/` 导出，2026-05-02。
