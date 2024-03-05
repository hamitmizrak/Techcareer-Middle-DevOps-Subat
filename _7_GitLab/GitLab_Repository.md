Command line instructions
You can also upload existing files from your computer using the instructions below.

# Git global setup
```sh
git config --global user.name "Hamit Mızrak"
git config --global user.email "hamitmizrak@gmail.com"
Create a new repository
git clone git@gitlab.com:techcareer/techcareer_middle_devops.git
cd techcareer_middle_devops
git switch --create main
touch README.md
git add README.md
git commit -m "add README"
git push --set-upstream origin main
```
---


# Push an existing folder
```sh
cd existing_folder
git init --initial-branch=main
git remote add origin git@gitlab.com:techcareer/techcareer_middle_devops.git
git add .
git commit -m "Initial commit"
git push --set-upstream origin main
```
---


# Push an existing Git repository
```sh
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.com:techcareer/techcareer_middle_devops.git
git push --set-upstream origin --all
git push --set-upstream origin --tags
```