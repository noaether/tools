# keymanagement.sh

## Introduction

This script is written in Bash and is used to perform various encryption/decryption operations and securely transfer sensitive data. The script contains several steps and makes use of openssl and ssh commands to perform these operations.

### Prerequisites

The script assumes that the following tools are installed on the system:

- Bash shell
- OpenSSL
- ssh-agent and ssh-add

## Variable Declaration

### Key Input

The script prompts the user to enter the password for the following keys:

- SSH Key
- SSL Key
- Fingerprint
- AES Key
The passwords are read using the `read` command and are stored in variables `SSH_KEYPASS`, `SSL_KEYPASS`, `FINGERPRINT_KEYPASS`, and `AES_KEYPASS`. If a password is not entered, the script terminates with a return code of 0.

### AES Key Decryption

The script uses the `openssl` command to decrypt the value of the `PASSWORD` variable, which was encrypted using AES encryption with the `aes-256-cbc` cipher. The decrypted password is stored in the `PASSWORD` variable. The openssl command is executed with the `-pbkdf2 -d -a` options, and the password for the AES key is passed using the `-pass` option.

### SSL Key Decryption

The script uses the `openssl` command to decrypt the value of the `PRIVATE_KEY` variable, which was encrypted using AES encryption with the `aes-256-cbc` cipher. The decrypted private key is stored in the `PRIVATE_KEY` variable. The openssl command is executed with the `-pbkdf2 -d -a` options, and the password for the SSL key is passed using the `-pass` option.

### SSH Key Addition

The script creates a temporary file `TMP_PRIVATEKEY` to store the decrypted private key. The file permissions are set to `600` to ensure that only the owner can access the file. The script then uses the `sed` command to modify the contents of the file to meet the required format for an SSH private key. The `eval` command is used to start a new `ssh-agent` instance, and the `ssh-add` command is used to add the private key to the `ssh-agent`. The password for the SSH key is passed to the `ssh-add` command using a pipeline.

### Fingerprint Decryption

The script uses the `openssl` command to decrypt the value of the `FINGERPRINT` variable, which was encrypted using AES encryption with the `aes-256-cbc` cipher. The decrypted fingerprint is stored in the `FINGERPRINT` variable. The `openssl` command is executed with the `-pbkdf2 -d -a` options, and the password for the fingerprint is passed using the `-pass` option.

### Known Hosts File

The script creates a temporary file `TMP_KNOWN_HOSTS` to store the decrypted fingerprint. The file permissions are set to `600` to ensure that only the owner can access the file.

### API Key Retrieval

The script creates two temporary files `TMP_APIKEYSENC` and `TMP_APIKEYS` to store the encrypted and decrypted API keys, respectively. The file permissions are set to `600` to ensure that only the owner can access the files. The script uses the `scp` command to securely copy the encrypted API key file `TMP_APIKEYSENC` from a remote server to the local machine. The `scp` command uses the Secure Shell (SSH) protocol to encrypt the transfer of data.

### API Key Decryption

The script uses the `openssl` command to decrypt the value of the `TMP_APIKEYSENC` file, which was encrypted using AES encryption with the `aes-256-cbc` cipher. The decrypted file is stored in the `TMP_APIKEYS` file. The `openssl` command is executed with the `-pbkdf2 -d -a` options, and the password for the file is passed using the `-pass` option.

## Program logic and functions

The script continues by defining three functions: check_keys, add_key, and del_key. These functions are used to manipulate the encrypted environment file, which holds the API keys, in different ways. The rest of the description is below:

### check_keys

This function takes two arguments, either the platform or the platform and name of the API key, and returns the value of the corresponding key in the encrypted environment file. It first converts the platform and name to uppercase using `awk`. If the second argument is not provided, it assumes that only the platform is provided, and sets the `key` variable to the platform. If both the platform and name are provided, it sets the `key` variable to a combination of the platform and name separated by an underscore.

Next, the function uses `grep` and `cut` to extract the value of the `key` from the encrypted environment file. If the `value` is not empty, it means that the key was found, and the function prints the value. Otherwise, it prints a message indicating that the key was not found.

Finally, the function deletes the temporary encrypted file and the private key used to decrypt the file, as well as the temporary decrypted file.

### add_key

This function takes three arguments, the platform, name of the API key (optional), and the value of the API key. Like the `check_keys` function, it converts the platform and name to uppercase using `awk`. If the name is not provided, it sets the `key` variable to the platform, and the value of the key to the second argument. If the name is provided, it sets the `key` variable to a combination of the platform and name separated by an underscore, and the value of the key to the third argument.

Next, the function appends the new key and its value to the decrypted environment file. It then encrypts the file again using `openssl` and a password stored in the `PASSWORD` variable. The encrypted file is then uploaded to the remote server using `scp`, and a success message is displayed. Finally, the function deletes the temporary encrypted file and the private key used to decrypt the file, as well as the temporary decrypted file.

### del_key

This function takes two or three arguments, the platform, name of the API key (optional), and removes the corresponding key from the decrypted environment file. Like the `check_keys` and `add_key` functions, it converts the platform and name to uppercase using `awk`. If the name is not provided, it sets the `key` variable to the platform. If the name is provided, it sets the `key` variable to a combination of the platform and name separated by an underscore.

The function uses `grep` to remove the line containing the specified key from the decrypted environment file. It then encrypts the file again using `openssl` and a password stored in the `PASSWORD` variable. The encrypted file is then uploaded to the remote server using `scp`, and a success message is displayed. Finally, the function deletes the temporary encrypted file and the private key used to decrypt the file, as well as the temporary decrypted file.

## Variable specification

In the script, the following variables are defined:

- `TMP_APIKEYSENC`: a temporary file for encrypted API keys
- `TMP_APIKEYS`: a temporary file for decrypted API keys
- `TMP_PRIVATEKEY`: a temporary file for private key used for SCP
- `TMP_KNOWN_HOSTS`: a temporary file for the known hosts file used for SCP
- `PASSWORD`: a password used to encrypt and decrypt the API keys

The following temporary files are created:

- `TMP_APIKEYSENC`: a temporary file for encrypted API keys, which is encrypted using OpenSSL with AES-256-CBC encryption algorithm, SHA512 message digest algorithm, and PBKDF2 key derivation function.
- `TMP_APIKEYS`: a temporary file for decrypted API keys, which is created by decrypting the encrypted `TMP_APIKEYSENC` file using OpenSSL with the password defined in the `PASSWORD` variable.
- `TMP_KNOWN_HOSTS`: a temporary file for the known hosts file used for SCP, which is used to store the fingerprints of the public keys of the servers to which the user is connecting, so that the user is alerted if a host key changes.
- `TMP_PRIVATEKEY`: a temporary file for the private key used for SCP, which is used for authentication when using SCP.
- The script first transfers the encrypted .apikeys.env.enc file from a remote server to the local machine using SCP with a private key for authentication. Then, it decrypts the encrypted .apikeys.env.enc file to obtain the decrypted .apikeys.env file using OpenSSL. The script provides three functions: check_keys, add_key, and del_key, which allow the user to check, add, and delete API keys respectively. After the script finishes executing, all the temporary files are deleted to ensure security.

## Execution stack

1. Starts the ssh-agent service.
2. Asks the user to enter the password for their SSH key and stores the password in the SSH_KEYPASS variable. If the user doesn't enter a password, the script will exit.
3. Asks the user to enter the password for their SSL key and stores the password in the SSL_KEYPASS variable. If the user doesn't enter a password, the script will exit.
4. Asks the user to enter the password for their fingerprint and stores the password in the FINGERPRINT_KEYPASS variable. If the user doesn't enter a password, the script will exit.
5. Asks the user to enter the password for their AES key and stores the password in the AES_KEYPASS variable. If the user doesn't enter a password, the script will exit.
6. Decrypts the password stored in the file with AES encryption using the password entered by the user and stores the decrypted password in the PASSWORD variable.
7. Decrypts the private key stored in the file with AES encryption using the password entered by the user and stores the decrypted key in the PRIVATE_KEY variable.
8. Writes the decrypted private key to a temporary file, modifies the format of the key, and adds the key to the ssh-agent.
9. Decrypts the fingerprint stored in the file with AES encryption using the password entered by the user and stores the decrypted fingerprint in the FINGERPRINT variable.
10. Writes the decrypted fingerprint to a temporary file.
11. Downloads the encrypted API keys from a remote server and stores it in a temporary file.
12. Decrypts the API keys using the password stored in the PASSWORD variable and stores the decrypted API keys in another temporary file.
13. Defines a function check_keys that takes two arguments (platform and name) and retrieves the corresponding API key for that platform and name from the decrypted API keys file.
