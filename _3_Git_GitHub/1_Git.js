Git
--- 
2005 Linus Torvalds
Ücretsiz 
Açık kaynak kodludur.
YEdekleme imkanı sağlar 
Proje takibini sağlar.
Birden fazla kişilerle çalışmayı sağlar.
Global Information Tracked
VCS: Version Control FileSystem
En önemli özelliği dağıtık mimariye ship olmasıdır.

---------------------------------------------------------------
## INIT ##
git init
git status
git add .
git commit -m "Dev-Middle-Project"
git remote add origin URL 
git push -u origin master (u => --set-upstream)
git push

---------------------------------------------------------------
## CLONE ##
git clone https://github.com/hamitmizrak/Techcareer-Middle-DevOps-Subat


---------------------------------------------------------------
## CONFIG ##
git config --global user.name
git config --global user.name "Hamit Mızrak"
git config --global user.email
git config --global user.email "hamitmizrak@gmail.com"
git config --global -l 
git config --global core.editor "notepad++"

---------------------------------------------------------------
## GIT COMMON ##
git --help (Komutları hatırlamak)
git status (Durumu öğrenmek)

---------------------------------------------------------------
## ADD ##
git add . 
git commit -m "Data"

# Add komutunu yazmadan direk commit üzerinden add yapalım.
git commit -a -m "Data2"


---------------------------------------------------------------
## ALIAS ##
git log 
git log --decorate --oneline --graph --all
git config --global alias.log44 "log --decorate --oneline --graph --all"
git log44


---------------------------------------------------------------
## REMOTE ##
git remote 
URL Değiştirmek => git remote set-url origin2 yeniURL


---------------------------------------------------------------
## CHECKOUT/SWITCH ##
Dikkat: checkout tyapmadan önce add yapmanız gerekmektedir.
git log 
git checkout hashCode(En az 7 karakter)
git checkout master

---------------------------------------------------------------
## STASH ##
Dikkat: stash tyapmadan önce add yapmanız gerekmektedir.
git add .
git stash
git stash save "customiseStashName"
git stash list
git stash apply stash@{0}
git stash drop stash@{0}
git stash pop


---------------------------------------------------------------
## BRANCH/ MERGE/REBASE ##
git branch -M main
git add .
git commit -m "branch öncesi"
git push 

git branch    (local branch)
git branch -a (Remote+local branch)

git log44

git branch backend (branch oluştur)
git checkout backend  (branch dallan)
git add .
git commit -m "backend"
git push origin backend (backend push)
cat >> backend.txt 
git add .
git commit -m "backend data"
git push -u origin backend
git commit -a -m "backend data-2"
git push 
git switch master
git checkout master 
git merge backend
git branch -D backend (silme)

git checkout master 
git merge backend (backend'i master'a birleştirme)
git merge backend --no-ff (backend'i master'a birleştirme)
cat >> frontend.txt 
git add .
git commit -m "backend data"
git push -u origin backend
git commit -a -m "backend data-2"
git push 
git switch master
git checkout master 
git merge backend

git checkout -b frontend (branch oluşturup dallanma)

---------------------------------------------------------------
## PULL/FETCH ##
git pull origin master
git pull origin backend
git pull origin frontend

git remote 
git remote -v 

git fetch origin 
git branch -a
git checkout remotes/origin/master
git checkout master
git merge origin/master

---------------------------------------------------------------
## TAG ##
git tag -a v1.0.0 -m "version 1.0"
git tag
git show v1.0.0
git push origin v1.0.0
git push origin --tags
git tag -d v1.0.0
git push origin :refs/tags/v1.0.0

---------------------------------------------------------------
## GİTHUB ##
Tamamdır.

---------------------------------------------------------------
## SSH-KEYGEN ##
ssh-keygen -t rsa -b 4096 -C "hamitmizrak@gmail.com"
eval `ssh-agent -s`  ==>  Agent pid 681
ssh -T git@github.com ==> SSH bağlantısı yapıldı mı ?

Windows => C:\Users\90553\.ssh
Linux   => cd ~/.ssh/id_rsa.pub
Public Şifre verdi

GitHub Adresine Yapıştır
https://github.com/settings/keys


---------------------------------------------------------------
## CONFLICT ##

