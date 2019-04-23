[![Docker Hub Build Status](https://dockerbuildbadges.quelltext.eu/status.svg?organization=burkeazbill&repository=docker-coredns)](https://hub.docker.com/r/burkeazbill/docker-coredns) [![Build Status](https://travis-ci.org/burkeazbill/docker-coredns.svg?branch=master)](https://travis-ci.org/burkeazbill/docker-coredns)[![](https://images.microbadger.com/badges/image/burkeazbill/docker-coredns.svg)](https://microbadger.com/images/burkeazbill/docker-coredns "Get your own image badge on microbadger.com")

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

## Test the DNS

You can confirm the dns is working with dig as follows, from the host running the container. Assuming you simply run the command line above without any modifications, you can use this:

```plain
dig @localhost gateway.example.com
```

This should result in the output including an ANSWER SECTION that shows gateway.example.com resolves to 192.168.1.1 as follows:

```plain
$ dig @localhost gateway.example.com


; <<>> DiG 9.10.6 <<>> @localhost gateway.example.com
; (2 servers found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 47780
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;gateway.example.com.		IN	A

;; ANSWER SECTION:
gateway.example.com.	3600	IN	A	192.168.1.1

;; AUTHORITY SECTION:
example.com.		3600	IN	NS	a.iana-servers.net.
example.com.		3600	IN	NS	b.iana-servers.net.

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
;; WHEN: Thu Jul 05 23:24:04 EDT 2018
;; MSG SIZE  rcvd: 169
```


## Learn more

- [Corefile explained](https://coredns.io/2017/07/23/corefile-explained/)
- [Quickstart Guide](https://coredns.io/2017/07/24/quick-start/)
