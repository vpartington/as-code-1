#!/bin/bash
#This is a git mockup
case ${1} in
"commit")
echo "[master c20e310] Updated
1 file changed, 1 insertion(+)"
;;
"push")
sleep 2
echo "Counting objects: 4, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 345 bytes | 0 bytes/s, done.
Total 4 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To git@github.com:xebialabs/xfile.git
   30651d6..c20e310  master -> master
"
sed -i -e 's/VERSION_TST=1.2/VERSION_TST=1.5/' ./versions
;;
esac