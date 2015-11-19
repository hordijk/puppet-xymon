#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with xymon](#setup)
    * [What xymon affects](#what-xymon-affects)
    * [Beginning with xymon](#beginning-with-xymon)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Install and configure xymon-client 

## Module Description

Download and install most recent pakages from http://sourceforge.net/projects/xymon/. Custom packages are allowed.

Provides an entry to install "monitors" from https://wiki.xymonton.org/doku.php/monitors

Since there is no main/oficial repository for Xymon nor continous/stable package building,
default package versions and OS compability are dependent on SourceForge's content.
Please check [limitations](#Limitations).

## Setup

### What xymon affects

* Install and configure xymon-client package and service 
* Manages /etc/default/xymon-client


### Beginning with xymon

```puppet
class {'xymon::client':
        servers => ['10.10.1.1']
}
```

## Usage

Instantiating xymon with a custom package
```puppet
class {'xymon::client':
        package_file    => 'http://your.custom.rpm/xymon-client.rpm',
        servers         => ['10.10.1.1']
}
```

Installing a monitor
```puppet
class {'xymon::client':
        servers         => ['10.10.1.1']
}

xymon::client::monitor{'mysql':
  cmd_file_source => 'puppet:///extra_files/xymon/monitors/bb-mysql/bb-mysql.pl',
  cfg_file_source => 'puppet:///extra_files/xymon/monitors/bb-mysql/bb-mysql.cf'    
}
```

Using hiera
```hiera
xymon::client:
  servers:
  - 192.168.2.210
xymon::factory:
  client_monitors:
    mysql:
      cmd_file_source: puppet:///extra_files/xymon/monitors/bb-mysql/bb-mysql.pl
      cfg_file_source: puppet:///extra_files/xymon/monitors/bb-mysql/bb-mysql.cfg
```



## Reference
###Classes
####`xymon::client`
    
Install and configure xymon-client

*`servers`

*Required*. List of Xymon servers to connect

*`package_file`

*Optional*. Custom package (.rpm or .deb) URL direction

*`package_provider`

*Optional*. Custom package provider used to install package


###Defined Types
####`xymon::client::monitor`

Install and configure a Xymon monitor

*`cmd_file_source`

*Required.* Source file of monitor's executable  (passed to a `file` type as `source` attribute) 

*`cfg_file_source`

*Optional.*. Source file that contains configuration file for monitor (passed to a `file` type as `source` attribute) 

*`disabled`

*Optional.* Boolean that disable the monitor

*`onhost`

*Optional.* See [tasks.cfg manpage](https://www.xymon.com/help/manpages/man5/tasks.cfg.5.html)

*`maxtime`

*Optional.* See [tasks.cfg manpage](https://www.xymon.com/help/manpages/man5/tasks.cfg.5.html)

*`needs`

*Optional.* See [tasks.cfg manpage](https://www.xymon.com/help/manpages/man5/tasks.cfg.5.html)

*`group`

*Optional.* See [tasks.cfg manpage](https://www.xymon.com/help/manpages/man5/tasks.cfg.5.html)

*`interval`

*Optional.* See [tasks.cfg manpage](https://www.xymon.com/help/manpages/man5/tasks.cfg.5.html)

*`crondate`

*Optional.* See [tasks.cfg manpage](https://www.xymon.com/help/manpages/man5/tasks.cfg.5.html)

*`envarea`

*Optional.* See [tasks.cfg manpage](https://www.xymon.com/help/manpages/man5/tasks.cfg.5.html)


## Limitations

Tested on CentOS 6 and 7, probally works on RedHat 6 and 7 too. Only x86_64 bit versions are posible with default packages.

For CentOS/RedHat 7, it's necessary to set SE Linux to permissive or disable mode, since original RPMs are not prepared for SE Linux

Debian 6, CentOS/RedHat 5 and Fedora 17 may work, since there is original packages for them. Debian has both amd64 and i386 versions.
 
Other Debians and Fedoras could worth a try. Modules will try to install a package that has a closer match with OS version 

## Development


## Release Notes/Contributors/Etc
 
