
## Add apt source

When using a `git://` resource, the `:` after the FQDN needs to be changed to a `/` otherwise APT will not support it.

```
deb gitlfs+https://github.com/Greenroom-Robotics/packages-test.git /
```

Add the SSH fingerprint and any required SSH keys:

```
sudo su
if [ ! -n "$(grep "^github.com " ~/.ssh/known_hosts)" ]; then ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts 2>/dev/null; fi
cp cp /home/your-user/.ssh/id_rsa* ~/.ssh/
```

## Setup apt-transport-gitlfs
```bash

sudo ln -s gitlfs gitlfs+https
sudo ln -s gitlfs gitlfs+git
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
