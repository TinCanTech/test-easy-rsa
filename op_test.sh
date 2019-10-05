#!/bin/sh
#
# Downloads the run_unit_tests.sh file from easyrsa-unit-tests repo
# and executes that - allows for disconnected testing from the easy-rsa
# repo with TravisCI.

#CURL_TARGET="OpenVPN/easyrsa-unit-tests"

#curl -O "https://raw.githubusercontent.com/$ERSA_UTEST_CURL_TARGET/master/easyrsa-unit-tests.sh"

if [ -e "easyrsa-unit-tests.sh" ];
then
	export ERSA_UTEST_CURL_TARGET="${ERSA_UTEST_CURL_TARGET:-tincantech/test-easyrsa-unit-tests}"
	sh easyrsa-unit-tests.sh -vv
fi

# rm easyrsa-unit-tests.sh
