[日本語](#weztermの設定)｜[English](#wezterm-configuration)

# WezTermの設定

## 目次

- [利用許諾（CC0、0BSD）](./license.md)
- [バージョン情報](./version.md)
- [WezTermをインストール](#weztermのインストール)
- [WezTermの設定を適用](#weztermの設定を適用)
- 技術文書
  - [`wezterm.lua`](./doc/wezterm.md)

## WezTermをインストール

[WezTerm公式サイト](https://wezterm.org/installation.html)（外部リンク）を参照すること。

## WezTermの設定を適用

最新版の設定を適用するためには以下の命令文を実行すること。ただし、設定ファイルはArchlinux系統のディストリビューションのデフォルトのパス（`${HOME}/.config/wezterm`）にダウンロードする。また、以下のフラッグやオプションを命令文に続けて付すことで、挙動を調整することができる。

- `-o`, `--overwrite`：設定ファイルが既に存在する場合は上書きする。
- `-p`, `--preserve`：設定ファイルが既に存在する場合は上書きしない。

``` bash
bash <(curl -s https://raw.githubusercontent.com/possior/config-wezterm/default/install.sh)
```

# WezTerm Configuration

## Table of Contents

- [License (CC0, 0BSD)](./license.md)
- [Version Information](./version.md)
- [Installing WezTerm](#installing-wezterm)
- [Applying WezTerm Configuration](#applying-wezterm-configuration)
- Technical Documents
  - [`wezterm.lua`](./doc/wezterm.md)

## Installing WezTerm

Reference the [WezTerm official site](https://wezterm.org/installation.html) (external link).

## Applying WezTerm Configuration

To apply the latest configuration, execute the following command. Note that this will download configuration files at the default path (`${HOME}/.config/wezterm`) on Archlinux-based distributions. You can modify the behavior by adding the following flags and options after the command.

- `-o`, `--overwrite`: overwrite if configuration files already exist
- `-p`, `--preserve`: don't overwrite if configuration files already exist

``` bash
bash <(curl -s https://raw.githubusercontent.com/possior/config-wezterm/default/install.sh)
```