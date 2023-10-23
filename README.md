# Bash script optimizes uncommitted images with tinypng API

## Installation
- Just clone this git repo where you want, e.g. user home dir
```shell
cd ~
git clone git@github.com:Git-I985/optimize-uncommitted.git
chmod +x ~/optimize-uncommitted/optimize-uncommitted.sh
```
- Get api key from https://tinypng.com/developers and paste it in your `~/.zshrc` or `~/.bashrc` in `TNF_API_KEY` variable, and extend PATH variable
```shell
# `~/.zshrc` or `~/.bashrc`
TNF_API_KEY=hasd7ha3da7sgd73gd7gasdasdha
PATH=~/optimize-uncommitted:$PATH
```

## Usage
```shell
cd <project directory>
optimize-uncommitted.sh
```