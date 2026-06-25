[日本語](#技術文書)｜[English](#technical-document)｜[`wezterm.lua`](../source/wezterm.lua)

# 技術文書

Archlinux系統のディストリビューションとKDE Wayland環境を想定している。その他のOSに適用する場合には設定を編集する必要がある。

## 目次

- [基本構造](#基本構造)
- [一般的な設定](#一般的な設定)

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
local ansi_dark = {"#000000", "#002200", "#003300", "#004400", "#005500", "#006600", "#007700", "#008800"}
local brights_dark = {"#007700", "#009900", "#00AA00", "#00BB00", "#00CC00", "#00DD00", "#00EE00", "#00FF00"}
local ansi_light = {"#00FF00", "#00DD00", "#00CC00", "#00BB00", "#00AA00", "#009900", "#008800", "#007700"}
local brights_light = {"#008800", "#006600", "#005500", "#004400", "#003300", "#002200", "#001100", "#000000"}
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
local ansi_dark = {"#000000", "#002200", "#003300", "#004400", "#005500", "#006600", "#007700", "#008800"}
local brights_dark = {"#007700", "#009900", "#00AA00", "#00BB00", "#00CC00", "#00DD00", "#00EE00", "#00FF00"}
local ansi_light = {"#00FF00", "#00DD00", "#00CC00", "#00BB00", "#00AA00", "#009900", "#008800", "#007700"}
local brights_light = {"#008800", "#006600", "#005500", "#004400", "#003300", "#002200", "#001100", "#000000"}
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

```lua
configuration.window_background_opacity = 0.8
```

# Technical Document

I assume a distribution based on Archlinux and environment of KDE Wayland. If you would like to apply to another OS, you need to modify the configuration.

## Table of Contents

- [Basic Structure](#basic-structure)
- [General Configuration](#general-configuration)

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
local ansi_dark = {"#000000", "#002200", "#003300", "#004400", "#005500", "#006600", "#007700", "#008800"}
local brights_dark = {"#007700", "#009900", "#00AA00", "#00BB00", "#00CC00", "#00DD00", "#00EE00", "#00FF00"}
local ansi_light = {"#00FF00", "#00DD00", "#00CC00", "#00BB00", "#00AA00", "#009900", "#008800", "#007700"}
local brights_light = {"#008800", "#006600", "#005500", "#004400", "#003300", "#002200", "#001100", "#000000"}
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
local ansi_dark = {"#000000", "#002200", "#003300", "#004400", "#005500", "#006600", "#007700", "#008800"}
local brights_dark = {"#007700", "#009900", "#00AA00", "#00BB00", "#00CC00", "#00DD00", "#00EE00", "#00FF00"}
local ansi_light = {"#00FF00", "#00DD00", "#00CC00", "#00BB00", "#00AA00", "#009900", "#008800", "#007700"}
local brights_light = {"#008800", "#006600", "#005500", "#004400", "#003300", "#002200", "#001100", "#000000"}
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

```lua
configuration.window_background_opacity = 0.8
```