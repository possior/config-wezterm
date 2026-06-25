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