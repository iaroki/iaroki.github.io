---
title: "Installation Asterisk 13 on Ubuntu 16.04"
date: 2017-10-25T12:35:22+03:00
tags: ["linux", "ubuntu", "asterisk"]
---

1) First thing to do is update our system:

```
root@asterisk:~# apt update
root@asterisk:~# apt upgrade
root@asterisk:~# reboot
```

2) Download sources:

```
root@asterisk:~# cd /usr/src
root@asterisk:/usr/src# wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-14-current.tar.gz
root@asterisk:/usr/src# wget https://downloads.asterisk.org/pub/telephony/libpri/libpri-current.tar.gz
root@asterisk:/usr/src# wget https://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-current.tar.gz
```

3) Install build tools:

```
root@asterisk:/usr/src# apt install build-essential wget libssl-dev libncurses5-dev libnewt-dev  libxml2-dev linux-headers-$(uname -r) libsqlite3-dev uuid-dev libjansson-dev
```

4) Extract the files from the tarballs:

```
root@asterisk:/usr/src# tar xvf asterisk-13-current.tar.gz
root@asterisk:/usr/src# tar xvf libpri-current.tar.gz
root@asterisk:/usr/src# tar xvf dahdi-linux-complete-current.tar.gz
```

5) Install **DAHDI**:

```
root@asterisk:/usr/src/dahdi-linux-complete-2.11.1+2.11.1# 
root@asterisk:/usr/src/dahdi-linux-complete-2.11.1+2.11.1# make
root@asterisk:/usr/src/dahdi-linux-complete-2.11.1+2.11.1# make install
root@asterisk:/usr/src/dahdi-linux-complete-2.11.1+2.11.1# make config
```

6) Install **libpri**:

```
root@asterisk:/usr/src# cd libpri-1.6.0/
root@asterisk:/usr/src/libpri-1.6.0# make
root@asterisk:/usr/src/libpri-1.6.0# make install
```

7) Install **Asterisk**:

```
root@asterisk:/usr/src# cd asterisk-13.17.2/
root@asterisk:/usr/src/asterisk-13.17.2# ./configure
root@asterisk:/usr/src/asterisk-13.17.2# make menuselect 
root@asterisk:/usr/src/asterisk-13.17.2# make
root@asterisk:/usr/src/asterisk-13.17.2# make install
root@asterisk:/usr/src/asterisk-13.17.2# make samples
root@asterisk:/usr/src/asterisk-13.17.2# make config
```

8) Start **DAHDI** and **Asterisk**:

```
root@asterisk:/usr/src/asterisk-13.17.2# systemctl start asterisk
```

9) Check results:

```
root@asterisk:/usr/src/asterisk-13.17.2# asterisk -rvvv
Asterisk 13.17.2, Copyright (C) 1999 - 2014, Digium, Inc. and others.
Created by Mark Spencer <markster@digium.com>
Asterisk comes with ABSOLUTELY NO WARRANTY; type 'core show warranty' for details.
This is free software, with components licensed under the GNU General Public
License version 2 and other licenses; you are welcome to redistribute it under
certain conditions. Type 'core show license' for details.
=========================================================================
Connected to Asterisk 13.17.2 currently running on asterisk (pid = 7007)
asterisk*CLI> dahdi show version
DAHDI Version: 2.6.1 Echo Canceller: HWEC
asterisk*CLI> pri show version
libpri version: 1.6.0
asterisk*CLI> 
```

---
