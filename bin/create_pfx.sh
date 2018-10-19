#!/usr/bin/env bash

openssl pkcs12 -export -out bruning.io.pfx -inkey privkey.pem -in cert.pem -certfile chain.pem
