# tools

<details>

<summary>keymanagement.sh</summary>

## Introduction
This script is a shell script that is used to securely store and retrieve sensitive information, such as encryption keys, authentication credentials, and server fingerprints.

## Basic functionality
The script is designed to securely access and retrieve sensitive information, specifically an encrypted API key. The first step in the process is to initiate an ssh-agent, which is an authentication agent that holds private keys used for public key authentication. The script then prompts the user for four different password inputs, which are used to unlock SSH, SSL, fingerprint, and AES keys. The script uses openssl to decrypt the encrypted private key and API key, with the passwords entered by the user.

Once the private key and API key have been decrypted, the script creates temporary files to store the private key, known hosts file, and decrypted API key. The script then uses the scp command to securely copy the encrypted API key from a remote server to the local machine. Finally, the script uses openssl to decrypt the API key and stores it in a temporary file. The check_keys function is provided to retrieve the desired API key value from the decrypted API key file.

</details>

