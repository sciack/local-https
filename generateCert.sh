#!/bin/sh

dirbase=`dirname $0`
build=$dirbase/build
conf=$dirbase/config
mkdir -p $build


echo "Generating root ca certificates"
openssl genpkey -outform PEM -out $build/rootCA.key -algorithm RSA -pkeyopt rsa_keygen_bits:2048s
openssl req -x509 -new -nodes -key $build/rootCA.key -sha256 -days 3650 -out $build/rootCA.pem -config  $conf/rootCA.cnf

echo "generating localhost certificate request"
openssl req -new -sha256 -nodes -out $build/server.csr -newkey rsa:2048 -keyout $build/server.key -config $conf/server.csr.cnf 

echo "signing certificate"
openssl x509 -req -in $build/server.csr -CA $build/rootCA.pem -CAkey $build/rootCA.key -CAcreateserial -out $build/server.crt -days 3650 -sha256 -extfile $conf/v3.ext