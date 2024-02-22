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
## BRANCH ##

---------------------------------------------------------------
## MERGE/REBASE ##

---------------------------------------------------------------
## PULL/FETCH ##

---------------------------------------------------------------
## TAG ##

---------------------------------------------------------------
## CONFLICT ##

---------------------------------------------------------------
## SSH-KEYGEN ##