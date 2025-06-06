FROM ubuntu:latest AS main

RUN apt-get -yqq update \
    && apt-get -yqq upgrade \
    && apt-get -yqq install samba winbind krb5-user ldapscripts libsasl2-modules-gssapi-mit dnsutils tini \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/* \
    && rm -f /etc/samba/smb.conf

COPY --chmod=755 scripts/init.sh /usr/local/bin/init.sh

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/init.sh"]
