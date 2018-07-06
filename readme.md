# Docker CoreDNS

## Overview

Need a lightweight, simple, container-based DNS server for your home or lab environment? Here it is! [CoreDNS](http://www.coredns.io). This docker based container image weighs in at a whopping 32.9MB ! That's it!

## Instructions

Choose which format file you wish to use:

- hosts file
- DNS Zone file

I've provided an example of each in the config folder.

Edit the config/Corefile as follows:

- Rename the file it is referencing to match your domain (change the example.com part of the filename to yourdomain.whatever)
- Uncomment the file type you wish to use (hosts/file)

Next, edit the zone file (db.example.com) or hosts file (example.com.hosts), adding entries for eacy of your hosts in the respective format.

Once you're done, simply type the following command to run the container in daemon mode (requires docker-compose):

```plain
docker-compose up -d
```

Prefer to simply run docker from the command line?

```plain
docker run -m 128m --expose=53 --expose=53/udp -p 53:53 -p 53:53/udp -v "$PWD"/config:/etc/coredns --name coredns burkeazbill/docker-coredns:1.1.4 -conf /etc/coredns/Corefile
```

## Learn more

- [Corefile explained](https://coredns.io/2017/07/23/corefile-explained/)
- [Quickstart Guide](https://coredns.io/2017/07/24/quick-start/)
