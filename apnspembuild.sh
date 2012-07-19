#!/bin/bash

if [ $# -lt 3 ]
  then echo "check your parameter - I need:  1: dev cert, 2: production cert, 3: your private  key"
 	exit
fi

pem_path='generated_pem_files'
temp_path='temp234'


mkdir $temp_path
mkdir $pem_path

# Convert the .cer file into a .pem file:
openssl x509 -in $1 -inform der -out $temp_path/apns-production-cert.pem
openssl x509 -in $2 -inform der -out $temp_path/apns-dev-cert.pem

#Convert the private key’s .p12 file into a .pem file: 
openssl pkcs12 -nocerts -out $temp_path/push-key.pem -in $3
openssl rsa -in $temp_path/push-key.pem -out $temp_path/push-key-noenc.pem

#need to combine the key and cert files into a apns-dev.pem
cat $temp_path/apns-dev-cert.pem $temp_path/push-key-noenc.pem > $pem_path/apns-dev.pem
cat $temp_path/apns-production-cert.pem $temp_path/push-key-noenc.pem > $pem_path/apns-production.pem

rm -rf $temp_path
