#!/bin/sh

# 1. Create the key with ssh-keygen. Name the file github_id_rsa. No passphrase
# 2. Encrypt it with (remember passphrase): gpg --symmetric --cipher-algo AES256 github_id_rsa
# 3. Make a secret in github repo with the passphrase
# 4. Add public key to authorized_keys file on server


# Decrypt the file
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$PASSPHRASE" --output github_id_rsa $1

chmod 0600 github_id_rsa
