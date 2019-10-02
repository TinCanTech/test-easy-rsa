#!/bin/sh
#
# Downloads the run_unit_tests.sh file from easyrsa-unit-tests repo
# and executes that - allows for disconnected testing from the easy-rsa
# repo with TravisCI.

#CURL_TARGET="OpenVPN/easyrsa-unit-tests"
CURL_TARGET="tincantech/test-easyrsa-unit-tests"

curl -O 'https://raw.githubusercontent.com/$CURL_TARGET/master/easyrsa-unit-tests.sh'

if [ -e "easyrsa-unit-tests.sh" ];
then
	sh easyrsa-unit-tests.sh -v
fi

# rm easyrsa-unit-tests.sh
