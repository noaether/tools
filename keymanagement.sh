#!/bin/bash
eval "$(ssh-agent -s)"

printf "Unlock SSH Key: "
read -s SSH_KEYPASS
if [ -z "$SSH_KEYPASS" ]; then exit 0; fi
echo "-*****-"

printf "Unlock SSL Key: "
read -s SSL_KEYPASS
if [ -z "$SSL_KEYPASS" ]; then exit 0; fi
echo "-*****-"

printf "Unlock fingerprint: "
read -s FINGERPRINT_KEYPASS
if [ -z "$FINGERPRINT_KEYPASS" ]; then exit 0; fi
echo "-*****-"

printf "Unlock AES Key: "
read -s AES_KEYPASS
if [ -z "$AES_KEYPASS" ]; then exit 0; fi
echo "-*****-"

PASSWORD=$(echo -n "U2FsdGVkX18kKg4W3dGx8wXWvvN2z3kIIj5FNedXaE8JF5c+hXJsy37jWxmS540+
ju1PVKuSUpBBV+eIN4p7zg==
" | openssl aes-256-cbc -pbkdf2 -d -a -pass "pass:$AES_KEYPASS")
if [ $? -ne 0 ]; then
    echo "openssl command returned a non-zero exit code @ AES"
    exit 1
fi

PRIVATE_KEY=$(echo -n 'U2FsdGVkX1+f9jEO3GBe7xK8ERC/cqkdvaAK+zFF0ddeFG4HYsC3JcSNu9HqSDgw
th353RW9rHhrz4v+5iRJy6vg3Wr8Qe9ikM/Ic2JCB0JlIcCDTv0mm1s1mUnDaZO0
NhgYxa3HFVvycfoUuLJaFyQ+GOqR/gg5ZCbsn4ReGN83Rv/VmuyPS0m3UbF/gLuA
stsnvsmYJwaj9IXfDd+EozPfjY7RsCQJbRUEZi4ZskToOakNize4xlRNjvlpBL4q
m0W/RDuZVz+GDr4H2FAlNSCkkvRqRRL19iFoUJIgoruEameuTqXjKy3G0JQ3WKGX
4PbEgGqAICFN60KZxGMIurQQXlbwcgpnifnbQCAzu2kdSP8ya+70713Qqfs+jul1
m9iwft6UyMvgn1Ctxpu3FAJ17qWdqhsFt9oK+X0wRlUVQzSLm4nrTRdLDX07w0Zp
51u0zy4lEyBrc/nssNCf4Jow8d93AvrWCZsdqM+d6OVKkadrQKY2YBjrrHhu/+Av
C+P5HepnpngNul0TUY11dH4n5XjtDyj+4YZ+wnKJEDu8OG6QKCDuuFCgofISyONm
zHQHTtpIHXRVR6RU5wvBJS2+e/ZhHj7T4nebIADPhrJaTj3gNXB7Z+gdOBt79vWK
Q0T9MQR42TFCDKonMAVcyzNiSi9fQpLb1tkr7VsAenkBwgqDF+3UzwZhk3JTvZlz
4Guc+m7Sbv+bFzSUZtA6ADTDXRn2xWAVjHCzBi4mHPanovwq5exBhaaL66GKemN/
Wk5Z+C0hk8S2u6aPSuRzCzCNxkGfXhv4KFTFCxaPqq3J7VajPIjGvi1qj0EcoMQd
4Ynz5DZmH+KZx4UiudiTsHfn4dhuz9jPbIUhYuhSgWLLwN547l6IhrBYGhiVGyj1
XFH7d5LIPwf8S8uSImtbU0d1N82r+wpKhEL5kEDF1z4/uaKLaonorQigcmF14gDB
IzcNKLQvigZN6Dy8AHZ0Okq/0fUxo095IPKBuRjiJa+hPbMq9xzlBH2qujpgWwLd
OPvmS0/8Jk1w9f1i8xBZp6RuW/WkDsxxUbwXALVca+0XdvpUB3FffdadbkbKmhqq
AIF8iihIq73lluF7jqYHq0jaRv9+hHMpaK5vBzdMDumU4RNEufyggXuUB2d8SXx4
cdS9A3hlhXHP7UCPg5RDw5+G/VRp/HDzm7NzC4/DCViw9Q+4JT0a9bt25g6HYrLH
Inwxj2qqOqZb/uT2muTTTZ3dVCYb43FK4OfiGWEVoxmbIWrfYHkfyD3N6xa9Ig41
BS6Tm1tSc33i1vJUm5Gbdwi7wMPWc7UVkS1rPKE52nUsyvP6G7b54cWUof6FN4ve
fOUBTyt6/MS0hu7TWJaqTQqpIx/JEkwJNnsQyf9EQHRgaJOkhx91mpqq9v12CWzd
8XR9PjRFBUQme6SbBzEVLYFLPotw0s2oDLfFGlR7ft1Aw+/pCs09dQo7XJmkf70n
tMN1Ju0ZaGZSz8jdf6etCKZnG7ZuHkwPz8jysMEsegdOV+JGDxbNWhNdcFyl1P7v
lM3an+w2avIa+dlnBoq4t38dWbN9/pvB0wgrGO40OUq2+2Qb2bx+RccSZZRxbE1d
V0MLDG4Hjj4uRHmRjtuydf8LFkv9CTptfXHdNKIyb1dmdvZ1HLSAL2R94H5zbs22
wZHfFVwYt09hJa5w2eYTGBF2FBMdwtdBTesoYt3TncBBfJhGkyn660A/BbW5cxhm
b//Kl4Q2vH7K1jvdn0lxV3m+rgpoFniuQEjUoVjZw0BQ52ZKJf81kd1kjhDLIytJ
IZ2GucfiPPMqw5VSrRc0JIj/cFAo4DIzZmjolgCxAWY3tR1Fkvom48BorjCWdgNm
OcSoXprpHyDh2Wr9+juujjvvprK5IrXAi5ziDEePPlhZcgETeRNgiHl8/HuqQGAi
aAtipu0fvufoPvuEy2yYf/kYoB/FrIB/LabiXiTEUjYFkssoELRKb27bWcEaLzJd
xz9pkijd8RenIQUKS2b/j+Un2IYJSSczcP0m8g67cJCKWltei+6Yoi1CNjlrBQnW
2stwnpX6sF9bw5juWh2USMS7oRvX8dVEWIKlMCMPeyjWnAQLgVcrF1A6SXNA8Zjc
OAfNePbVarbv1MS+2MMjIaYJ/BUJI2gwzHL3ZItbNb1C2QMcy8tELuo5MUqRfuRN
V1NhbTXzaW+mlOlNEH8qcoCcKeAoy5/Wd3j+8qAqkbz9hXQCHiRNl/Id8GGanO/9
sFo+Agd/p/7pecXxXE+Odcuuk66JdUDIKDYkZQMD9rfYb0jYZqNJJBivs7cFP1EJ
W8GsrnZihZXEp1XOSFsTsM66hYgA7pyxkhnUkG9ozfOE2HKojreuE1bOqrKl+OCQ
s+LL64tYTUqg6KMVmPl/WDEPGZIcAdZCSmwnlBpUY/Jh/uoagrzO9PSLT9R8Rz78
siS6yt2mEzjmm4Lfc9s5LLB48s4MNzLdGWc7u8zg+A1M+plunGzkmhWQdIvc5P51
MJYi3clf8KBHB/xO5r2biE/3xLqgn1BOsVndAe++tFeFm4tWmaTpCmkisXvkENxS
2bvF1HULXWWIi4nzQdM6JajIT66hIsguxwuPODlb1ebpenGRB77Jyd0tRrfcWT5U
T0LOtILJxMd4zoF6bkfErSme1lnZLb2rkIfhd+V4sp7+dGgLaWJG7MKQpe1uAejU
FiOSnrubqI5LuOZHLG89J8Qol0nVfF94MjBGKqhnvJpmDsYdlAgXjWVRIOVeXhtj
IgF2HxNz14UwcywhR9WxLCLs29VHYRis+XtCUbGYlBPVQUM8K14i7pTlg8dHiTdm
v1+SLvNb3nZwaZ4uQlY7oPFX+3le7pbNylJK03sZgF5iml3TZtEd7UbgtS7Oy+RE
VqiMQ1jdLTqohx17X6nBH+MzTjeRc9JjyoKPnsXS8Clu/xPcaqV2ed5LSY7QDkJ4
FjyCl6ZO3f7GS95x5Vi8NFlI2EWCLuo+vPKjr0aG8ryjTAA2r8D63PJCFI0cJ0BB
7aAscRvK1RO9yzb/DEgATQ3/cIWW0/B896RgXDYrfo5unx6feHVlwIgxoCYKy2jO
rl6CRt9YfaeNJSx1mBm71TUIlNuXoVpTXHjHWm0a05muimp6H/Gn7KdqrOzjvHq4
UqckK1L7lGMJ+3UC5/fXrzoTasBF+b1N+cAsWhugfl8RzsS2LG4CFb5Xvv1ukpRQ
HG78AATyIgJ9Rsz1e22T3WS3GQvCNwxdz3xCVIkVNTaFvW2efidtb6yKJuSLfhy5
Hc7emqllxjbqDZRK7mCIRd+D0TkAKNT9EI8U2p6e4Pcw0kuQvNS/tMOW4TmSsGum
4SnJv5Va4rxiIoumV99xNOTuP4ZnJuUZc9xa+NALYMFWJiZt9wyRivi7bEdeps+h
kEV2IvfuG/svooF4XtFKWLCOmEtg7+K7FF6Fr4OAzXnuk+AcknXv4z9ndUBKNd0Y
HXwerJ4SkWSX2DfqnELgDmV8We8xL+uqkkz2dZJe/qGlow/TbKDvNneO5IDER+qn
nhgHB/fVcoVeTyX1is2hrGHlvFbH0Bo920RQrGzCEGc=' | openssl aes-256-cbc -pbkdf2 -d -a -pass "pass:$SSL_KEYPASS")
if [ $? -ne 0 ]; then
    echo "openssl command returned a non-zero exit code @ SSL"
    exit 1
fi
TMP_PRIVATEKEY=$(mktemp)
echo "${PRIVATE_KEY// /$'\n'}" > "$TMP_PRIVATEKEY"
chmod 600 $TMP_PRIVATEKEY
sed -i 's/OPENSSH//g' $TMP_PRIVATEKEY
sed -i 's/PRIVATE//g' $TMP_PRIVATEKEY
sed -i 's/KEY-----//g' $TMP_PRIVATEKEY
sed -i 's/-----BEGIN/-----BEGIN OPENSSH PRIVATE KEY-----/g' $TMP_PRIVATEKEY
sed -i 's/-----END/-----END OPENSSH PRIVATE KEY-----/g' $TMP_PRIVATEKEY
sed -i '/^$/d' $TMP_PRIVATEKEY

eval $(ssh-agent -s)  > /dev/null 2>&1
{ sleep .3; echo $SSH_KEYPASS; } | script -q /dev/null -c "ssh-add $TMP_PRIVATEKEY" > /dev/null 2>&1



FINGERPRINT=$(echo -n 'U2FsdGVkX1/Dl+57Y8MbHD/VAcD/s4BgSjOQ45IjermnNhKdUb0Onf3MHWQOb+tL
LvZZSjrll7SU0Ein4NdvdRQDbSHUaPh8A0LWm4KQm8zyvr2MlpkRmxQO5aAI/PEo
n8kczg2aj/oKF3VjsWc+K3oIuNaqCnLx9rnt85w256F3ijjGvKVIlgHRvYDJXI+C
R28gEfpoE7uejJe4dmkWcxMZOP/7Wv7hN3FIpjBI8IuAhsA2lfZ2GweoHlgRZcL1
7XRZlI1r3+4RS1RxAJjR/8c9Rkf7CSOS7+/w5xipdMvHowUDj47kewfWf6cZCD+P
7W/wJ+3ikCmBFPck2vY5EkK06rmlN8aO/Sfxl+x1lEL6OqunJHLgDnXomG9otjnd
slTkDPbM1QBSLe3Jms+qQ/EVUfSFt+GWyj+FUWGKEunOdj6xrH3pYKzr+JHnjeML
07NVswJJpU97/aJjEzLEALoAlIGCkFVKCjBZzwhy1iKHmcFpFs/zz0+kxdRf9j93
VR/UjgK3TQ3p71uMuj0mIgzGT5rdkiaBfg3MQAjwIaV4htxVJjyVDWEkEC3AdOgO
bKtq9pzlEllRStB6njn4VBWe3XVhQ0KPR9AANwA07LgtPQ95uwojEUPbm5vDvbpS
Ed1JMTMD5eDJjqOoCS+Iur0DzQP/TDvZj19/YYFHCDnBJzZ3g01BjPT9tswYfBBp
o063DBzhmqwRGZatir6ZqUbjRZJDewAlNvJwAEgU5wXCOS8u+gQlnLVc4tWEgOtq
BvX5zcBVccE7Tr1I8qpbrLc1/GkWAbFe9RpihQwb7APHa+JG+COGyI9O9548u5AJ
MbwlbHpKH/614+Z3xZB5IjJUMtnGaSRSnpfpM/lJjXgg+770DcItPVlISiBR1OEZ
6hmusQwRsyqlpTf1tqeckIGDKV1rgJ/K1F536Uz0x6Th4lPM5++avBDTSqSF7b4q
8S9yuR4Mwk8PWm45xC4vkaE7lFxT7bAezrJo+Cg4K2huRZjrna86LnNWLu0zRqzt
mVQilsKxIhMiiC770Qd+LTxTFBoSa+4/H2S+50fDpBYHd1R06y0RT+dO7IFawic5
evIVA30tU9KK9CoDO4TJdQeXgYAVKD1b/6Jfdvl4MbsOEpWfcRzpJ8zH88NsmI7S
fqWzuhC46ZXYULAcSAvNm6HyRk9aqD7RNOnoWK1ERENqrqv7Dw/kTJciYPaM6Wj9
osX8uQ+gHjNkWugJh48IIN+y5UtMUDAxcSxhQRObEmJPQsWy3GgOfCE/qZ43NOnO
OUPTYWS0RRiNvmWlvTQSMw/TYdQkG7jrLBUOJcMPSobqwc498jXQksmlvvCVAhiS
QFVihxEYCaidhVCQ5hh3zfKfA+k72IvKfSH+vF38o7j1KGYFDvHsXF/RAb4N9FYZ
WfajEpiaxkHwZqk1fDBckmtI/dKKujqNRL+bgA62/2NpNcV/TRU1yzbypHBJeszI
m06Fv/YfudgZdNTBlngiZqwU2ow0dYFW1REEs4Bs4CX+mSTesnI9KVnqsiaupH5V
d5Sk+L9OOJ8dIYJK2BBCvX8EK7Y5GRiZ/jqVL5Y1buml9c815kqpkcLCAcZZzpwT
TlLK/PaPZ71PCEddE9gtLikZsIp9O7rmpJ/QSuyTLozny2Ba/xPv/IwC+j/QaRYe
T1+nq/08XxuxY5jt6KAkX7IrKp91TKtLLJjm2ySjWe9Bob9Za9jf9TgtAzonMtT/
Kve1uqEFr6zwGqjbE/73zA==' | openssl aes-256-cbc -pbkdf2 -d -a -pass "pass:$FINGERPRINT_KEYPASS")
if [ $? -ne 0 ]; then
    echo "openssl command returned a non-zero exit code @ FINGERPRINT"
    exit 1
fi
TMP_KNOWN_HOSTS=$(mktemp)
echo "$FINGERPRINT" >"$TMP_KNOWN_HOSTS"
chmod 600 $TMP_KNOWN_HOSTS

TMP_APIKEYSENC=$(mktemp)
chmod 600 $TMP_APIKEYSENC
TMP_APIKEYS=$(mktemp)
chmod 600 $TMP_APIKEYS
scp -q -i "$TMP_PRIVATEKEY" -o StrictHostKeyChecking=yes -o UserKnownHostsFile="$TMP_KNOWN_HOSTS" -P 7258 root@74.208.150.155:/root/.apikeys.env.enc "/tmp/"
mv /tmp/.apikeys.env.enc $TMP_APIKEYSENC
if [ $? -ne 0 ]; then
    echo "scp command returned a non-zero exit code @ SSH"
    exit 1
fi
openssl enc -d -aes-256-cbc -md sha512 -pbkdf2 -in $TMP_APIKEYSENC -out $TMP_APIKEYS -pass "pass:$PASSWORD"
if [ $? -ne 0 ]; then
    echo "openssl command returned a non-zero exit code @ APIKEYS"
    exit 1
fi

function check_keys {
    # Check if there are two arguments
    if [ -z $2 ]; then
        platform=$(echo "$1" | awk '{print toupper($0)}')
        key="${platform}"
    else
        platform=$(echo "$1" | awk '{print toupper($0)}')
        name=$(echo "$2" | awk '{print toupper($0)}')
        key="${platform}_${name}"
    fi
    
    # Get the value of the key from the .env file
    value=$(grep -E "^${key}=" $TMP_APIKEYS | cut -d '=' -f 2-)
    
    # Check if the key exists
    if [ -n "$value" ]; then
        printf "\nThe value of the key ${key} is: ${value}\n"
    else
        printf "\nKey not found: ${key}\n"
    fi
    
    rm $TMP_APIKEYS
    rm $TMP_APIKEYSENC
    rm $TMP_KNOWN_HOSTS
    rm $TMP_PRIVATEKEY
}

function add_key {
    # Check if there are two arguments
    # $1 platform; $2 key
    # $1 platform; $2 name; $3 key
    platform=$(echo "$1" | awk '{print toupper($0)}')
    if [ -z "$3" ]; then
        key="${platform}"
        value="$2"
    else
        name=$(echo "$2" | awk '{print toupper($0)}')
        key="${platform}_${name}"
        value="$3"
    fi
    
    # Write the new key to the local .apikeys.env file
    echo "${key}=${value}" >>$TMP_APIKEYS
    
    # Encrypt the data on the local machine
    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -in $TMP_APIKEYS -out $TMP_APIKEYSENC -pass "pass:$PASSWORD"
    
    printf "\nAdding the key to the remote .apikeys.env file...\n"
    scp -o IdentityFile=$TMP_PRIVATEKEY -o UserKnownHostsFile=$TMP_KNOWN_HOSTS -q -P 7258 $TMP_APIKEYSENC root@74.208.150.155:/root/.apikeys.env.enc
    printf "\nKey added successfully!\n"
    
    rm $TMP_PRIVATEKEY
    rm $TMP_APIKEYS
    rm $TMP_APIKEYSENC
    rm $TMP_KNOWN_HOSTS
}

function del_key {
    platform=$(echo "$1" | awk '{print toupper($0)}')
    if [ -z "$3" ]; then
        key="${platform}"
    else
        name=$(echo "$2" | awk '{print toupper($0)}')
        key="${platform}_${name}"
    fi
    
    # Remove the key from the temporary .apikeys.env file
    grep -v "^${key}=" $TMP_APIKEYS >$TMP_APIKEYS.new
    mv $TMP_APIKEYS.new $TMP_APIKEYS
    # Encrypt the data on the local machine
    openssl enc -aes-256-cbc -md sha512 -pbkdf2 -salt -in $TMP_APIKEYS -out $TMP_APIKEYSENC -pass "pass:$PASSWORD"
    
    printf "\nRemoving the key to the remote .apikeys.env file...\n"
    scp -o IdentityFile=$TMP_PRIVATEKEY -o UserKnownHostsFile=$HOMETMP_KNOWN_HOSTS -q -P 7258 $TMP_APIKEYSENC root@74.208.150.155:/root/.apikeys.env.enc
    printf "\nKey removed successfully!\n"
    
    rm $TMP_PRIVATEKEY
    rm $TMP_APIKEYS
    rm $TMP_APIKEYSENC
    rm $TMP_KNOWN_HOSTS
}

if [ "$1" == "add" ]; then
    add_key "$2" "$3" "$4"
    elif [ "$1" == "del" ]; then
    del_key "$2" "$3"
else
    check_keys "$1" "$2"
fi
