FROM coredns/coredns:1.7.0

LABEL maintainer="Burke Azbill"

EXPOSE 53 53/udp
VOLUME ["/etc/coredns"]
ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]
