---
title: "Brew install app without updating"
date: 2022-03-18T14:15:29+03:00
tags: ["macos", "brew"]
---

I have been using MacOS for some time now and tried different approaches for local development applications management.
First solution that comes to mind is the Brew.
Second solution was using nix with home-manager.


Each application management approach has it's pros and cons but about this in another article.


For now I want to note solution for specific Brew usecase.

Currently I work with very limited internet connection and trying to implement some sort of remote development machine.
This should work pretty well but I still need to install locally some apps or dependencies which currently managed by Brew.

One of the things about Brew that drives me crazy is whenever I want to install some packadge I expirience few minutes of Brew updating.
And this becomes even worse with very clow internet connection in my case.

All I want is to install some app, not update everything that managed by Brew. And there is such option not explicitly mentioned anywhere.

You cat setup environmental variable `HOMEBREW_NO_AUTO_UPDATE=1` to disable Brew updating before installing something.

I found this option extremely useful in situations like mine with very limited internet connection.

There is global setting for your shell `~/.bashrc` or `~/.zshrc`:

```
### Bash ###
$ vim ~/.bashrc
export HOMEBREW_NO_AUTO_UPDATE=1

### Zsh ###
$ vim ~/.zshrc
export HOMEBREW_NO_AUTO_UPDATE=1
```

Or one time execution command:

```
HOMEBREW_NO_AUTO_UPDATE=1 brew install <app>
```

Now you can install any Brew formulas without updating everything

---
