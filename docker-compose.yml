version: '3.1'
services:
    coredns:
        build: .
        container_name: coredns
        restart: on-failure # other option: always - if you want persistent through host reboots
        expose:
            - '53'
            - '53/udp'
        ports:
            - '53:53'
            - '53:53/udp'
        volumes:
            - './config:/etc/coredns'