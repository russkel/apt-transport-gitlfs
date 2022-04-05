# apt-transport-gitlfs
Use a GitLFS repository to store debian packages.

Code is based off the [apt-transport-s3](https://github.com/MayaraCloud/apt-transport-s3) project.
## Add apt source

### Using git:// protocol
When using a `git://` resource, the `:` after the FQDN needs to be changed to a `/` otherwise APT will not support it.

```
deb gitlfs+https://github.com/Greenroom-Robotics/packages-test.git /
```
Add the SSH fingerprint and any required SSH keys to clone the repository:

```
sudo su
if [ ! -n "$(grep "^github.com " ~/.ssh/known_hosts)" ]; then ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts 2>/dev/null; fi
cp /home/your-user/.ssh/id_rsa* ~/.ssh/
```


### Using HTTPS protocol
```
deb gitlfs+https://github.com/Greenroom-Robotics/packages-test.git /
```


## Setup apt-transport-gitlfs
Install the `.deb` package from the releases in this repository.
```bash

sudo ln -s gitlfs gitlfs+https
sudo ln -s gitlfs gitlfs+git
```

## Setup a new GitLFS-APT git repo

```bash
mkdir apt-repo
cd apt-repo
git init
git lfs install
git lfs track "*.deb"
git lfs track "*.ddeb"
git config -f .lfsconfig lfs.fetchexclude '*'
git add .gitattributes .lfsconfig
git commit -m 'Initial setup of apt-transport-gitlfs repo'
```

## TODOs
* GitHub Action CI for rebuilding package metadata (maybe using [aptly](https://github.com/aptly-dev/aptly))