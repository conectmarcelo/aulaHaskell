#!/bin/bash

clear
git add . &&

git commit -m $1 &&

git push origin master &&

Username='conectmarcelo'
Password='mozzy@02'

ssh root@51.91.121.28 <<EOF

senha='lYVl47xW'
password $senha
cd aulaHaskell &&

git pull origin master &&

stack build &&

lsof -i:80 -Fp | sed  's/^p//' | head -n -1 | xargs kill -9;
nohup stack exec aulahaskell > /dev/null

echo "deploy finished"

EOF