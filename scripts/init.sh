#!/bin/bash

PREP_SCRIPT=/usr/local/bin/prep.sh
SAMBA_CONFIG_FILE=/etc/samba/smb.conf
KRB5_CONFIG_FILE=/var/lib/samba/private/krb5.conf

#
# Check if prep script exists. If so, source it to run it.
#
if [[ -f "$PREP_SCRIPT" ]]; then
  source "$PREP_SCRIPT"
fi

#
# If both the samba and krb5 config files exist, we can safely assume Samba has been properly configured.
#
if [[ -f "$SAMBA_CONFIG_FILE" && -f "$KRB5_CONFIG_FILE" ]]; then
  cp -f "$KRB5_CONFIG_FILE" /etc/krb5.conf
  exec samba --interactive --no-process-group
else

  echo "Couldn't find either the Samba configuration file or the Kerberos configuration file."
  echo
  echo "If this container hasn't been provisioned yet, please exec into the container and run"
  echo "samba-tool to provision this container."
  sleep infinity

fi
