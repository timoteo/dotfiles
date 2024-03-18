# dotfiles

This repository contains my dotfiles to setup new machines and sync settings config between machines. It uses [Chezmoi](https://chezmoi.io/) to manage the configuration.

## Installation

To install the dotfiles on a fresh machine, run the following command:

```sh
export GITHUB_USERNAME=timoteo
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME

## Setting up dotfiles

In order to add new dotfile(s) to be managed by chezmoi, run the following command:

```sh
# assume a number of files exist under .config/newapp that represents new dotfiles
chezmoi add .config/newapp
# go to the git dotfiles repo directory
chezmoi cd
git add .config/newapp
git commit -m "Update .zshrc"
git push
```

This method could also technically be used to edit existing dotfile(s), but the following method is recommended.

## Updating existing dotfiles

To change existing chezmoi-managed dotfile(s) on a machine (e.g. `.zshrc`), run the following commands:

```sh
cd
# make the edits in the editor
# note: you could also do: 'chezmoi edit --apply .zshrc' to combine this and the following step
chezmoi edit .zshrc # conceptually, this command is like: chezmoi cd && vim .zshrc
# apply the .zshrc edits to the current machine
chezmoi apply
chezmoi cd
git add .zshrc
git commit -m "Update .zshrc"
git push
```

## Applying changes to another machine

If you need to apply changes that have been pushed to the `dotfiles` repo on another machine, run the following command:

```sh
chezmoi update
```

This will pull all changes from the `dotfiles` repo and apply them to the current machine.

## Other commands

* `chezmoi status` - summarize what files would be changed on `chezmoi apply`
* `chezmoi diff` - show the diffs that would be applied with `chezmoi apply` 
