# My Nix Configuration

This is my personal nix configuration. I use it to define my system configuration with [nix-darwin](https://daiderd.com/nix-darwin/), and my user configuration and environment with [home-manager](https://github.com/nix-community/home-manager).

I got it started from [this video](https://www.youtube.com/watch?v=LE5JR4JcvMg&pp=ygUQbml4IGRhcndpbiBzZXR1cA%3D%3D) mostly and slowly made it my own.

## Post Clone
```sh
git submodule update --init --recursive
```


## Other stuff

RUN FIRST WITHOUT HOMEBREW, otherwise homebrew will bootstrap a bunch of cask deps that we want nix to install

### other settings I manually changed:
 - share menu options (extension -> share menu)
 - turn off siris voice
 - finder preferences + toolbar

