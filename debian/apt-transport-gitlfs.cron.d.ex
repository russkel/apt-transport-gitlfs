#
# Regular cron jobs for the apt-transport-gitlfs package
#
0 4	* * *	root	[ -x /usr/bin/apt-transport-gitlfs_maintenance ] && /usr/bin/apt-transport-gitlfs_maintenance
