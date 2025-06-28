# No Sudo Unix Terminal

> This started from personal experience and an initial blog I wrote [Working without Sudo in Unix Terminal](https://anirudhg07.hashnode.dev/working-without-sudo-in-unix-terminal).

**Motivation**: Have you ever experienced the frustration of being unable to install softwares in your Terminal for easy code editing or even packages, when you remote access your Unix machine which you donot have `sudo` access of, and working on it without your major toolkit like `lazygit`, `yazi`, `fzf`, `zoxide`, `eza`, etc. is a pain. You try to build from source, or just give up on how complex it maybe and start using the default ones.

**So?**: This repository include some ideas on how to work around this problem by finding alternatives or "jugaad" (means workaround or hack in Hindi) solutions to make your Unix experience better without `sudo` privileges which I found. This repository is to help you with that and have a fast, reliable, reproducible way to make your remote Unix shell be the same as your local one.

If you like this repository, please give it a star ⭐ and share it with your friends. If you have any suggestions or improvements, feel free to open an issue or a pull request.

<details> <summary>Click to read some rant 😬</summary>

The most common idea of installing terminal command line applications is to build from source. But that is 1) Slow, 2) Sometimes not possible and 3) You have skill issue even reading the docs to do it. So you try AI solutions for it, which you blindly do it, which temporarily work but eventually breaks, because well, iykyk... Well, this repo will help you hopefully in many ways.

And if you live under a rock and use your default terminal and shell, with default terminal commands, either you are a 100x dev and KNOW HOW TO USE THEM, and in that case also, you won't use the default ones either, OR you just don't care OR you are a noob and (thinking optimistically) take this oppurtunity to learn and improve your terminal skills.

Even I am learning and improving my terminal skills, so let's learn and explore together :) !

</details>

## Table of Contents

- [IDE and non-terminal Solution 🤖](#ide-and-non-terminal-solution-)
- [Building from Scratch 🦥](#building-from-scratch-)
- [Using Gift Repositories 🎁](#using-gift-repositories-)
  - [Text Editors](#text-editors)
  - [Shells](#shells)
- [Downloading Prebuilt Binaries 💪⚡](#downloading-prebuilt-binaries-)
  - [General Command Line tools](#general-command-line-tools)
  - [Text Editors](#text-editors-1)
  - [Shells](#shells-1)
- [Pat yourself on the back! 🎉](#pat-yourself-on-the-back-)
- [GOALS (TODO)](#goals-todo)
- [Contributing](#contributing)

## IDE and non-terminal Solution 🤖

You can connect SSH to your remote Unix machine using IDE's and install plugins helping you code editing -

- [VSCode](https://code.visualstudio.com/docs/remote/ssh)
- [JetBrains Gateway](https://www.jetbrains.com/help/idea/remote-development-with-jetbrains-gateway.html).

## Building from Scratch 🦥

- You can build from source, but you may face some issues with dependencies, and it can be time-consuming. But if you want to go this route, you can search on web on how to do it, or use LLM's for more details.

But here is another way for some of the tools you might be looking for. Please understand the method and then use it for your tools.

### Using Gift Repositories 🎁

You can use repositories which provide you with some pre-built scripts(which I call `gift` repositories) which commonly present languages like `Python` and `sh` to get you started.

Now, Step 1. install [uv](https://docs.astral.sh/uv/) (Python package manager) if you don't have it already. This is an amazing, fast and modern replaceemnt from pip and you can install ALL Pypi present tools without `sudo` privileges.

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Now, there exists a lot of python wrapper installations for various tools which I will list below.

1. [Bing-su/pip-binary-factory](https://github.com/Bing-su/pip-binary-factory). Truly a gift. This repository has a lot of good languages/tools. I will highlight some of them.

- `lazygit-py` - Installs [`lazygit`](https://github.com/jesseduffield/lazygit) for you using simply `uv tool install lazygit-py`
- `yazi-bin` - Install [`yazi`](https://github.com/sxyazi/yazi) for you with `uv tool install yazi-bin`. You can also clone your yazi plugins and more which doesn’t require sudo.
- `fzf-bin` - Install [`fzf`](https://github.com/junegunn/fzf) with `uv tool install fzf-bin`. You can also have integrations of fzf with your shells and other tools.
- `rustup-init-bin` - Install `rustup-init` command which when you run, installs `rustup` and hence all other rust toolchains like `cargo`, `clippy`, `rustc`, etc. This means now you have all possibly rust based tools which you can install! I will expand more on this in a later section.
  and more.

2. [tmux-python/libtmux](https://github.com/tmux-python/libtmux) - Install `tmux` using Python with this. You can install plugins and themes without `sudo`.

3. [Pypi](https://pypi.org/) and [crates.io](https://crates.io/) - Using `uv` and `cargo`, you have all access to all sorts of packages from these websites.

### Text Editors

You can use `nano`, `vim` with simple vimrc customizations(if you don’t have one, search the web or AI for one), with its plugins. Here are some links for more infamous and modern text editors by building from source.

- [emacs](https://www.gnu.org/software/emacs/)
- [helix](https://docs.helix-editor.com/master/building-from-source.html)
- [micro](https://github.com/zyedidia/micro) can be installed with `uv tool install micro-editor`, using our Gift repository.
- [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md) - Here is an installation guide for building neovim from source.

<details><summary>Click to see instructions on building Neovim</summary>

```bash
# Step 1. Git clone the Repo
git clone https://github.com/neovim/neovim.git
cd neovim

# Step 2. Build
make CMAKE_BUILD_TYPE=Release
make CMAKE_INSTALL_PREFIX=$HOME/local/nvim install

# And you are done. Find the path where `nvim` executable is present
# And make an alias in ~/.bashrc(or your shellrc).
alias nvim="$HOME/local/nvim/bin/nvim"
```

</details>

You can then install all your plugins for your text-editor manually or using dotfiles, which do not require `sudo` privileges.

### Shells

Some of the commonly shells used include `bash`(which is mostly pre-installed), `zsh`, `fish`, `nushell`, etc. You can install them from source, but some shells like `fish` require `sudo` privileges to install. Here are some ways to install others -

1. **zsh** - You can install `zsh` from a Gift Repository like [zsh-bin](https://github.com/romkatv/zsh-bin).
2. **nushell** - This can be installed with `cargo`, which you got from the `rustup-init` command we installed earlier. Now run -

```bash
cargo install nu --locked
```

3. **fish** - So far I haven't found a way to install `fish` without `sudo` privileges, but check out [Installation](https://github.com/fish-shell/fish-shell?tab=readme-ov-file#getting-fish) instructions for more details.

## Downloading Prebuilt Binaries 💪⚡

The best and fastest way to install tools is to download prebuilt binaries from GitHub releases or other sources. You can use [`eget`](https://github.com/zyedidia/eget) to download prebuilt binaries. You can install `eget` using `uv tool install eget-py`(from our Gift repository) or by building from source using -

```bash
git clone https://github.com/zyedidia/eget
cd eget
make build # or go build (produces incomplete version information)
```

### General Command Line tools

You can install some of the commonly used command line tools without `sudo` by installing them in `~/.local/bin` PATH, which you have permissions to modify. The `--to` flag lets set PATH and `--upgrade-only` flag lets you upgrade tools to latest versions. Here are some example.

```bash
eget zyedidia/micro --tag nightly
eget jgm/pandoc --to /usr/local/bin
eget junegunn/fzf
eget ogham/exa --asset ^musl
eget --system darwin/amd64 sharkdp/fd
eget BurntSushi/ripgrep
eget -f eget.1 zyedidia/eget
eget zachjs/sv2v
eget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz --file go --to ~/go1.17.5
eget --all --file '*' ActivityWatch/activitywatch
eget sharkdp/bat --to ~/.local/bin
eget charmbracelet/glow
```

and many more. I have provided a simple script which you can use as your package manager to install and upgrade these tools at [eget-pm.sh](./eget-pm.sh).

### Text Editors

- `neovim` - `eget neovim/neovim --to ~/.local/bin`
- `helix` - `eget helix-editor/helix --to ~/.local/bin`
- `micro` - `eget zyedidia/micro --to ~/.local/bin`
- `emacs` - Check out [emacs-mirror/emacs](https://github.com/emacs-mirror/emacs) for more details on how to install it from source.

### Shells

- `zsh` - `eget romkatv/zsh-bin --to ~/.local/bin`
- `nushell` - `eget nushell/nushell --to ~/.local/bin`
- `fish` - `eget fish-shell/fish-shell --to ~/.local/bin`. This may have some complications chosing the correct binary, I will leave that upto you.

## Pat yourself on the back! 🎉

Amazing! Now you have all your most tools installed without `sudo` privileges. You can expand them more with plugins or themes, if they have any. Use dotfile management with tools like [gnu-stow](), [chezmoi](https://www.chezmoi.io/), etc. and have the full control of your remote Unix machine without sudo privileges.
If you find more such cool tools or ideas, please share them with us!

## GOALS (TODO)

- Make a CLI tool which can easily install software without `sudo` privileges.

## Contributing

If you find more amazing resourced, tools or ideas, please open an issue to discuss. I will be happy to add them here. Please star the repository if you like it and want to support it.
