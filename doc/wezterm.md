[日本語](#技術文書)｜[English](#technical-document)｜[`wezterm.lua`](../src/wezterm.lua)

# 技術文書

Archlinux系統のディストリビューションとKDE Wayland環境を想定している。その他のOSに適用する場合には設定を編集する必要がある。

## 目次

- [基本構造](#基本構造)
- [一般的な設定](#一般的な設定)
- [キーの設定](#キーの設定)

## 基本構造

``` lua
local wezterm = require("wezterm")
local configuration = wezterm.config_builder()
-- 設定 --
return configuration
```

WezTermを管理する主要なモジュール（`wezterm`）を読み込む。

- [WezTerm｜Lua Reference｜`wezterm` module](https://wezterm.org/config/lua/wezterm/index.html)（外部リンク）

``` lua
local wezterm = require("wezterm")
```

設定ビルダー（`wezterm.config_builder()`）で設定テーブルを作成する。Luaのテーブルでも設定テーブルを代替できるが、設定ビルダー（`wezterm.config_builder()`）を使用すれば無効な設定に対してエラーを出してくれる。

- [WezTerm｜Lua Reference｜`wezterm` module｜`wezterm.config_builder()`](https://wezterm.org/config/lua/wezterm/config_builder.html)（外部リンク）

``` lua
local configuration = wezterm.config_builder()
```

設定テーブルを返還する。

``` lua
return configuration
```

## 一般的な設定

- [WezTerm｜Lua Reference｜`Config` struct](https://wezterm.org/config/lua/config/)（外部リンク）

``` lua
local ansi_dark = {"#000000", "#006300", "#006F00", "#007B00", "#008700", "#009300", "#009F00", "#00AB00"}
local brights_dark = {"#000000", "#00B700", "#00C300", "#00CF00", "#00DB00", "#00E700", "#00F300", "#00FF00"}
local ansi_light = {"#FFFFFF", "#009C00", "#009000", "#008400", "#007800", "#006C00", "#006000", "#005400"}
local brights_light = {"#FFFFFF", "#004800", "#003C00", "#003000", "#002400", "#001800", "#000C00", "#000000"}
local ansi = ansi_dark
local brights = brights_dark
configuration.automatically_reload_config = true
configuration.colors = {}
configuration.colors.ansi = ansi
configuration.colors.background = ansi[1]
configuration.colors.brights = brights
configuration.colors.cursor_bg = brights[2]
configuration.colors.cursor_border = brights[2]
configuration.colors.cursor_fg = brights[1]
configuration.colors.foreground = ansi[8]
configuration.colors.selection_bg = brights[2]
configuration.colors.selection_fg = brights[1]
configuration.font = wezterm.font_with_fallback("Liberation Mono", "IPAexGothic", "Symbols Nerd Font Mono")
configuration.kde_window_background_blur = true
configuration.use_ime = true
configuration.window_background_opacity = 0.8
```

自動で設定の変更を検出してその設定を適用する。

- [WezTerm｜Lua Reference｜`Config` struct｜`automatically_reload_config`](https://wezterm.org/config/lua/config/automatically_reload_config.html)（外部リンク）

``` lua
configuration.automatically_reload_config = true
```

色パレットを指定する。

- [WezTerm｜Lua Reference｜`Config` struct｜`colors`](https://wezterm.org/config/lua/config/colors.html)（外部リンク）
- [WezTerm｜Colors & Appearance](https://wezterm.org/config/appearance.html)（外部リンク）

```lua
local ansi_dark = {"#000000", "#006300", "#006F00", "#007B00", "#008700", "#009300", "#009F00", "#00AB00"}
local brights_dark = {"#000000", "#00B700", "#00C300", "#00CF00", "#00DB00", "#00E700", "#00F300", "#00FF00"}
local ansi_light = {"#FFFFFF", "#009C00", "#009000", "#008400", "#007800", "#006C00", "#006000", "#005400"}
local brights_light = {"#FFFFFF", "#004800", "#003C00", "#003000", "#002400", "#001800", "#000C00", "#000000"}
local ansi = ansi_dark
local brights = brights_dark
configuration.colors = {}
configuration.colors.ansi = ansi
configuration.colors.background = ansi[1]
configuration.colors.brights = brights
configuration.colors.cursor_bg = brights[2]
configuration.colors.cursor_border = brights[2]
configuration.colors.cursor_fg = brights[1]
configuration.colors.foreground = ansi[8]
configuration.colors.selection_bg = brights[2]
configuration.colors.selection_fg = brights[1]
```

フォントを指定する。Liberation Mono、IPAexゴシック、Symbols Nerd Font Monoの順にフォントを使用する。

- [WezTerm｜Lua Reference｜`Config` struct｜`font`](https://wezterm.org/config/lua/config/font.html)（外部リンク）
- [WezTerm｜Lua Reference｜`wezterm` module｜`wezterm.font_with_fallback()`
`](https://wezterm.org/config/lua/wezterm/font_with_fallback.html)（外部リンク）

``` lua
configuration.font = wezterm.font_with_fallback("Liberation Mono", "IPAexGothic", "Symbols Nerd Font Mono")
```

背景に暈しを入れる。KDE Waylandのプロトコールを使用する。

- [WezTerm｜Lua Reference｜`Config` struct｜`kde_window_background_blur`](https://wezterm.org/config/lua/config/kde_window_background_blur.html)（外部リンク）

``` lua
configuration.kde_window_background_blur = true
```

IMEによる入力を有効化する。これを有効化しなければ日本語を入力できない。

- [WezTerm｜Lua Reference｜`Config` struct｜`use_ime`](https://wezterm.org/config/lua/config/use_ime.html)（外部リンク）

``` lua
configuration.use_ime = true
```

背景に透かしを入れる。

- [WezTerm｜Colors & Appearance｜Window Background Opacity](https://wezterm.org/config/appearance.html#window-background-opacity)（外部リンク）

```lua
configuration.window_background_opacity = 0.8
```

## キーの設定

設定の適用前に予めキーの設定をバックアップしたい場合は、以下の命令文を実行することで有効なLua形式でその設定を出力できる。

- [WezTerm｜Default Key Assignments](https://wezterm.org/config/default-keys.html)（外部リンク）

``` lua
wezterm show-keys --lua > wezterm.lua.bak
```

- [WezTerm｜Configuring Key Assignments](https://wezterm.org/config/keys.html)（外部リンク）
- [WezTerm｜Key Tables](https://wezterm.org/config/key-tables.html)（外部リンク）

``` lua
configuration.disable_default_key_bindings = true
configuration.keys = {
    {key = "Tab", mods = "CTRL", action = action.ActivateTabRelative(1)},
    {key = "_", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "CTRL", action = action.SendKey({key = "C", mods = "CTRL"})},
    {key = "c", mods = "CTRL", action = action.SendKey({key = "c", mods = "CTRL"})},
    {key = "N", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "n", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "W", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "CTRL", action = action.SendKey({key = "V", mods = "CTRL"})},
    {key = "v", mods = "CTRL", action = action.SendKey({key = "v", mods = "CTRL"})},
    {key = "Tab", mods = "SHIFT|CTRL", action = action.ActivateTabRelative(-1)},
    {key = "_", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "c", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "N", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "n", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "W", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")},
    {key = "v", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")}
}
```

デフォルトのキーを無効化する。

- [WezTerm｜Default Key Assignments](https://wezterm.org/config/default-keys.html)（外部リンク）

```lua
configuration.disable_default_key_bindings = false
```

キーとその挙動を設定する。

- [WezTerm｜Configuring Key Assignments](https://wezterm.org/config/keys.html)（外部リンク）
- [WezTerm｜Key Tables](https://wezterm.org/config/key-tables.html)（外部リンク）

```lua
configuration.keys = {
    {key = "Tab", mods = "CTRL", action = action.ActivateTabRelative(1)},
    {key = "_", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "CTRL", action = action.SendKey({key = "C", mods = "CTRL"})},
    {key = "c", mods = "CTRL", action = action.SendKey({key = "c", mods = "CTRL"})},
    {key = "N", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "n", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "W", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "CTRL", action = action.SendKey({key = "V", mods = "CTRL"})},
    {key = "v", mods = "CTRL", action = action.SendKey({key = "v", mods = "CTRL"})},
    {key = "Tab", mods = "SHIFT|CTRL", action = action.ActivateTabRelative(-1)},
    {key = "_", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "c", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "N", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "n", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "W", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")},
    {key = "v", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")}
}
```

# Technical Document

I assume a distribution based on Archlinux and environment of KDE Wayland. If you would like to apply to another OS, you need to modify the configuration.

## Table of Contents

- [Basic Structure](#basic-structure)
- [General Configuration](#general-configuration)
- [Key Configuration](#key-configuration)

## Basic Structure

``` lua
local wezterm = require("wezterm")
local configuration = wezterm.config_builder()
-- configuration --
return configuration
```

Load the primary module (`wezterm`) for managing WezTerm. 

- [WezTerm | Lua Reference | `wezterm` module](https://wezterm.org/config/lua/wezterm/index.html) (external link)

``` lua
local wezterm = require("wezterm")
```

Create a configuration table using the configuration builder (`wezterm.config_builder()`). While a Lua's table can alter the configuration table, the one created by the configuration builder (`wezterm.config_builder()`) can generate errors against invalid configuration.

- [WezTerm | Lua Reference | `wezterm` module | `wezterm.config_builder()`](https://wezterm.org/config/lua/wezterm/config_builder.html) (external link)

``` lua
local configuration = wezterm.config_builder()
```

Return the configuration table.

``` lua
return configuration
```

## General Configuration

- [WezTerm｜Lua Reference｜`Config` struct](https://wezterm.org/config/lua/config/) (external link)

``` lua
local ansi_dark = {"#000000", "#006300", "#006F00", "#007B00", "#008700", "#009300", "#009F00", "#00AB00"}
local brights_dark = {"#000000", "#00B700", "#00C300", "#00CF00", "#00DB00", "#00E700", "#00F300", "#00FF00"}
local ansi_light = {"#FFFFFF", "#009C00", "#009000", "#008400", "#007800", "#006C00", "#006000", "#005400"}
local brights_light = {"#FFFFFF", "#004800", "#003C00", "#003000", "#002400", "#001800", "#000C00", "#000000"}
local ansi = ansi_dark
local brights = brights_dark
configuration.automatically_reload_config = true
configuration.colors = {}
configuration.colors.ansi = ansi
configuration.colors.background = ansi[1]
configuration.colors.brights = brights
configuration.colors.cursor_bg = brights[2]
configuration.colors.cursor_border = brights[2]
configuration.colors.cursor_fg = brights[1]
configuration.colors.foreground = ansi[8]
configuration.colors.selection_bg = brights[2]
configuration.colors.selection_fg = brights[1]
configuration.font = wezterm.font_with_fallback("Liberation Mono", "IPAexGothic", "Symbols Nerd Font Mono")
configuration.kde_window_background_blur = true
configuration.use_ime = true
configuration.window_background_opacity = 0.8
```

Automatically detect change in configuration and apply it.

- [WezTerm｜Lua Reference｜`Config` struct | `automatically_reload_config`](https://wezterm.org/config/lua/config/automatically_reload_config.html) (external link)

``` lua
configuration.automatically_reload_config = true
```

Specify the color pallete.

- [WezTerm | Lua Reference | `Config` struct | `colors`](https://wezterm.org/config/lua/config/colors.html) (external link)
- [WezTerm | Colors & Appearance](https://wezterm.org/config/appearance.html) (external link)

```lua
local ansi_dark = {"#000000", "#006300", "#006F00", "#007B00", "#008700", "#009300", "#009F00", "#00AB00"}
local brights_dark = {"#000000", "#00B700", "#00C300", "#00CF00", "#00DB00", "#00E700", "#00F300", "#00FF00"}
local ansi_light = {"#FFFFFF", "#009C00", "#009000", "#008400", "#007800", "#006C00", "#006000", "#005400"}
local brights_light = {"#FFFFFF", "#004800", "#003C00", "#003000", "#002400", "#001800", "#000C00", "#000000"}
local ansi = ansi_dark
local brights = brights_dark
configuration.colors = {}
configuration.colors.ansi = ansi
configuration.colors.background = ansi[1]
configuration.colors.brights = brights
configuration.colors.cursor_bg = brights[2]
configuration.colors.cursor_border = brights[2]
configuration.colors.cursor_fg = brights[1]
configuration.colors.foreground = ansi[8]
configuration.colors.selection_bg = brights[2]
configuration.colors.selection_fg = brights[1]
```

Specify fonts: Liberation Mono, IPAexGothic, and Symbols Nerd Font Mono in this order.

- [WezTerm | Lua Reference | `Config` struct | `font`](https://wezterm.org/config/lua/config/font.html) (external link)
- [WezTerm | Lua Reference | `wezterm` module | `wezterm.font_with_fallback()`
`](https://wezterm.org/config/lua/wezterm/font_with_fallback.html) (external link)

``` lua
configuration.font = wezterm.font_with_fallback("Liberation Mono", "IPAexGothic", "Symbols Nerd Font Mono")
```

Blur the background. This utilizes the KDE Wayland's protocol.

- [WezTerm | Lua Reference | `Config` struct | `kde_window_background_blur`](https://wezterm.org/config/lua/config/kde_window_background_blur.html) (external link)

``` lua
configuration.kde_window_background_blur = true
```

Enable inputs by IME. You cannot input Japanese if this disabled.

- [WezTerm | Lua Reference | `Config` struct | `use_ime`](https://wezterm.org/config/lua/config/use_ime.html) (external link)

``` lua
configuration.use_ime = true
```

Make the background transparent.

- [WezTerm | Colors & Appearance | Window Background Opacity](https://wezterm.org/config/appearance.html#window-background-opacity) (external link)

```lua
configuration.window_background_opacity = 0.8
```

## Key Configuration

If you would like to back up key configuration in advance of applying configuration, execute the following command to output it in a valid Lua format.

- [WezTerm｜Default Key Assignments](https://wezterm.org/config/default-keys.html) (external link)

``` lua
wezterm show-keys --lua > wezterm.lua.bak
```

- [WezTerm | Configuring Key Assignments](https://wezterm.org/config/keys.html) (external link)
- [WezTerm | Key Tables](https://wezterm.org/config/key-tables.html) (external link)

``` lua
configuration.disable_default_key_bindings = true
configuration.keys = {
    {key = "Tab", mods = "CTRL", action = action.ActivateTabRelative(1)},
    {key = "_", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "CTRL", action = action.SendKey({key = "C", mods = "CTRL"})},
    {key = "c", mods = "CTRL", action = action.SendKey({key = "c", mods = "CTRL"})},
    {key = "N", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "n", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "W", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "CTRL", action = action.SendKey({key = "V", mods = "CTRL"})},
    {key = "v", mods = "CTRL", action = action.SendKey({key = "v", mods = "CTRL"})},
    {key = "Tab", mods = "SHIFT|CTRL", action = action.ActivateTabRelative(-1)},
    {key = "_", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "c", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "N", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "n", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "W", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")},
    {key = "v", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")}
}
```

Disable default keys.

- [WezTerm | Default Key Assignments](https://wezterm.org/config/default-keys.html) (external link)

```lua
configuration.disable_default_key_bindings = false
```

Configure keys and their behavior.

- [WezTerm | Configuring Key Assignments](https://wezterm.org/config/keys.html) (external link)
- [WezTerm | Key Tables](https://wezterm.org/config/key-tables.html) (external link)

```lua
configuration.keys = {
    {key = "Tab", mods = "CTRL", action = action.ActivateTabRelative(1)},
    {key = "_", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "CTRL", action = action.SendKey({key = "C", mods = "CTRL"})},
    {key = "c", mods = "CTRL", action = action.SendKey({key = "c", mods = "CTRL"})},
    {key = "N", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "n", mods = "CTRL", action = action.SpawnTab("CurrentPaneDomain")},
    {key = "W", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "CTRL", action = action.SendKey({key = "V", mods = "CTRL"})},
    {key = "v", mods = "CTRL", action = action.SendKey({key = "v", mods = "CTRL"})},
    {key = "Tab", mods = "SHIFT|CTRL", action = action.ActivateTabRelative(-1)},
    {key = "_", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "-", mods = "SHIFT|CTRL", action = action.DecreaseFontSize},
    {key = "+", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "=", mods = "SHIFT|CTRL", action = action.IncreaseFontSize},
    {key = "C", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "c", mods = "SHIFT|CTRL", action = action.CopyTo("Clipboard")},
    {key = "N", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "n", mods = "SHIFT|CTRL", action = action.SpawnWindow},
    {key = "W", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "w", mods = "SHIFT|CTRL", action = action.CloseCurrentTab({confirm = true})},
    {key = "V", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")},
    {key = "v", mods = "SHIFT|CTRL", action = action.PasteFrom("Clipboard")}
}
```