# Octopak
Install Flatpaks from their GitHub repositories.
## Installation
```
meson build
ninja -C build
sudo ninja -C build install
```
## Setting up your repository
Create a file called `octopak.json` in your repository root, with the following content:
```json
{
    "manifest": "manifest url"
}
```
and fill in `manifest` with the relative path to your manifest (e.g. `com.rutins.C19track2.json`).
## Installing apps
```
$ octopak install <org>/<repo>
```
For example, to install [c19track2](https://github.com/aleksrutins/c19track2):
```
$ octopak install aleksrutins/c19track2
```
It will use the Flatpak user installation to install packages.
