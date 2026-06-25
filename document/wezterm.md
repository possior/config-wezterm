[日本語](#技術文書)｜[English](#technical-document)｜[`wezterm.lua`](../source/wezterm.lua)

# 技術文書

## 目次

- [基本構造](#基本構造)

## 基本構造

``` lua
local wezterm = require("wezterm")
local configuration = wezterm.config_builder()
return configuration
```

WezTermを管理する主要なモジュール（`wezterm`）を読み込む。

- [WezTerm｜Lua Reference｜`wezterm` module](https://wezterm.org/config/lua/wezterm/index.html)（外部リンク）

``` lua
local wezterm = require("wezterm")
```

設定ビルダー（`wezterm.config_builder()`）で設定テーブルを作成する。Luaのテーブルでも設定テーブルを代替できるが、設定ビルダー（`wezterm.config_builder()`）を使用すれば無効な設定に対してエラーを出してくれる。

# Technical Document

## Table of Contents

- [Basic Structure](#basic-structure)

## Basic Structure

``` lua
local wezterm = require("wezterm")
local configuration = wezterm.config_builder()
return configuration
```

Load the primary module (`wezterm`) for managing WezTerm. 

- [WezTerm | Lua Reference | `wezterm` module](https://wezterm.org/config/lua/wezterm/index.html) (external link)

``` lua
local wezterm = require("wezterm")
```

Create a configuration table using the configuration builder (`wezterm.config_builder()`). While a Lua's table can alter the configuration table, the one created by the configuration builder (`wezterm.config_builder()`) can generate errors against invalid configuration.