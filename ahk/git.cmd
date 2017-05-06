pwd
ls
cd work
cd project
mkdir ahk
cd ahk
git init

git config --global user.name "naoki"
git config --global user.email "naoki@gmail.com"
git config -l

cat "test" > testfile
git add .
git diff
git diff cached
git log
git commit -m "first commit"
git remote add origin git@github.com:naotake51/naoki_keys.git
git push -u origin master

ssh-keygen -R git@github.com:naotake51/my_ahk.git