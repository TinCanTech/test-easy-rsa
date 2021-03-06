#!/bin/sh
#
# Downloads the run_unit_tests.sh file from easyrsa-unit-tests repo
# and executes that - allows for disconnected testing from the easy-rsa
# repo with TravisCI.

# Set in Travis: CUSTOM CONFIG
# env: ERSA_UTEST_CURL_TARGET="OpenVPN/easyrsa-unit-tests"

#export ERSA_UTEST_CURL_TARGET="${ERSA_UTEST_CURL_TARGET:-OpenVPN/easyrsa-unit-tests}"
export ERSA_UTEST_CURL_TARGET="${ERSA_UTEST_CURL_TARGET:-tincantech/easyrsa-unit-tests}"
#export ERSA_UTEST_CURL_TARGET="${ERSA_UTEST_CURL_TARGET:-tincantech/test-easyrsa-unit-tests}"

curl -O "https://raw.githubusercontent.com/$ERSA_UTEST_CURL_TARGET/master/easyrsa-unit-tests.sh"
EXIT_CODE=1

if [ -e "easyrsa-unit-tests.sh" ];
then
	EXIT_CODE=0
	sh easyrsa-unit-tests.sh -vv || EXIT_CODE=1
	rm easyrsa-unit-tests.sh
fi

exit "$EXIT_CODE"
