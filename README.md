# local-https
Generate Key for local https

This project is inspired by this page [https://www.freecodecamp.org/news/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec/](https://www.freecodecamp.org/news/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec/) that explain how to create an HTTPS key for localhost.

I just create an sh script and the configuration file in order to have it automated.

The only "manual" step is to import the certificate `build/rootCA.pem" in your keychain and in all the program that doesn't use the system keystore.

All the certificate will be generated in `build` directory.

## Requirement

The script require openssl installed, for MacOs will work only with the brew version:

```
brew install openssl
```
and read carefully the output of the command in order to install it properly.

Not tested on Windows, but should work with Cygwin.

## Usage
change the following configuration file located in `config`:

* rootCA.cnf
* server.csr.cnf

in order to reflect your data.

Execute `./generateCert.sh` script, by default will generate a 10y key, if you want you can change the expiration and the algorithm.

In the `build` directory you will find the following files:

* rootCA.key - Key of the root CA for localhost
* rootCA.pem - Certificate of the root CA, to be imported in all the trust store
* server.crt - Certificate for localhost, has to be configured in your application (Public Key)
* server.key - The private key of the server, usually must be configured in your application
* server.csr - Certificate request, can be ignored
* rootCA.slr - Not used, serial number of the rootCA

