FROM coredns/coredns:1.6.9

LABEL maintainer="Burke Azbill"

EXPOSE 53 53/udp
VOLUME ["/etc/coredns"]
ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]
