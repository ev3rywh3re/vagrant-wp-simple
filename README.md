# Simple WordPress Vagrant

This is a relatively simple configuration package that will use vagrant, virtualbox, and puppet to create and configura a webserver running WordPress on your computer.

This project has a simple set of goals:

* Setup a WordPress site at http://www.wp.dev
* Setup a phpMyAdmin site at http://db.wp.dev
* Allow access to WordPress files at [this-directory]/sites/www/
* Allow access to phpMyAdmin files at [this-directory]/sites/db/

# Installation

Required software

* Virtualbox
* Vagrant
* Vagrant - hostsupdater

**Virtualbox**

Virtualbox is a virtual computer system allowing you to have the Linux Operating System running inside your current computer operating system. VirtualBox is usable on MacOS, Windows, and Linux. You can download and install this software by visiting [https://www.virtualbox.org]

**Vagrant**

Vagrant is a virtual machine management application. Vagrant allows the configuration and setup of virtual computers. The Vagrant application uses VirtualBox to launch and run the virtual computers running on your local computer. You can download and install Vagrant by visiting [https://www.vagrantup.com/]

**Vagrant - hostsupdater**

Vagrant - hostsupdater is a plugin for the Vagrant application that allows it to modify the networking settings of your main operating system. This will allow you to use customized hostnames and domain names.

## Instalation Procedure

All installation procedures assume you have administrative access to your comparator to install software. Some of these procedures utilize installation applications that are common to most computer users, but some steps may require the use of a terminal application to run some commands. On MacOS these commands are run using Terminal, and on many versions of Windows the commands will use the CMD application.

### Primary Applications & Utilities

These are the basic applications and utilities that need to be installed.

1. Install VirtualBox by visiting [https://www.virtualbox.org], downloading the latest version, and running the downloaded installation application.
2. Install Vagrant by visiting [https://www.vagrantup.com/], downloading the latest version, and running the downloaded installation application.
3. Install Vagrant - hostsupdater by using a command line utility (on MacOS use Terminal and on Windows use CMD). The command to use is `# vagrant plugin install vagrant-hostsupdater`

### 
