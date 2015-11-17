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

Download and install most recent pakages from http://sourceforge.net/projects/xymon/

There is no main/oficial repository for Xymon nor continous/stable package building, so default package versions and OS compability are dependent on SourceForge's content. Please check compability issues.      

## Setup

### What xymon affects

* Install and configure xymon-client package and service 
* manages /etc/default/xymon-client


### Beginning with xymon

```puppet
class {'xymon::client':
        servers => ['10.10.1.1']
}
```

## Usage

Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here. 

## Reference
###Classes
####`xymon::client`
    
Install and configure xymon-client

#####`package_file`

Custom package (.rpm or .deb) URL direction

#####`package_provider`

Custom provider to install package

#####`servers`

List of Xymon servers to connect

## Limitations

Tested on CentOS 6 and 7, probally works on RedHat 6 and 7 too. Only x86_64 bit versions are posible with default packages.

For CentOS/RedHat 7, it's necessary to set SE Linux to permissive or disable mode, since original RPMs are not prepared for SE Linux

Debian 6, CentOS/RedHat 5 and Fedora 17 may work, since there is original packages for them. Debian has both amd64 and i386 versions.
 
Other Debians and Fedoras could worth a try. Modules will try to install a package that has a closer match with OS version 

## Development


## Release Notes/Contributors/Etc **Optional**
 
