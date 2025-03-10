# Viper Env Z-Shell plugin

Automatically activates and deactivates a Python virtualenv upon `cd` in and out.

## Inspiration

Based on [blueray](https://stackoverflow.com/users/1772898/blueray)'s [answer](https://stackoverflow.com/a/63955939/11685534), I decided to go one step further and implement it as a Z-Shell plugin.

## Usage
<!-- [![asciicast](https://asciinema.org/a/4iMwcKfBS1dc1EgI1FihrDVxT.svg)](https://asciinema.org/a/4iMwcKfBS1dc1EgI1FihrDVxT) -->

![Alt text](./make_animation/assets/final.svg)

## Installation

### Oh My Zsh

Git clone this repository to [the Oh My Zsh custom plugins folder](https://github.com/ohmyzsh/ohmyzsh#custom-plugins-and-themes).

Add plugin to plugins directive in `~/.zshrc`
```zsh
plugins=(
  # put local oh-my-zsh plugins here
  viper-env
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
``` 

### Antigen
It is recommended to use a `.antigenrc` file. Then add the following to it:

```zsh
antigen bundle DanielAtKrypton/viper-env

# Apply changes
antigen apply
```

Make sure in your `.zshrc` Antigen is loading the `.antigenrc` file as follows:
```zsh
antigen init ~/.antigenrc
```
