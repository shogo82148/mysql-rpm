# mysql-rpm
RPM package for MySQL

## Installing on AlmaLinux 10

Run the following in the directory containing the built RPMs:

```sh
sudo dnf install --setopt=install_weak_deps=False ./*.rpm
```

This installs all built packages, including the test and debug packages.
Disable weak dependencies for this transaction because AlmaLinux 10 can
otherwise select MariaDB 11.8 packages alongside MySQL, causing file conflicts
such as `/usr/bin/mysql` and `/usr/sbin/mysqld`. Required dependencies are still
installed.
