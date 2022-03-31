
## Add apt source

```
deb gitlfs+https://github.com/Greenroom-Robotics/packages-test.git /
```

## Setup apt-transport-gitlfs
```bash

sudo ln -s gitlfs gitlfs+https
```

## Setup a new GitLFS based APT repository

```bash
mkdir apt-repo
cd apt-repo
git init
git lfs install
git lfs track "*.deb"
git lfs track "*.ddeb"
git add .gitattributes
git commit -m 'Initial setup of apt-transport-gitlfs repo'
```
