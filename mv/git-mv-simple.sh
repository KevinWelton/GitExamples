#!/bin/sh

folder="git-mv"

if [ -d "./$folder" ]; then
    rm -rf git-mv
fi

mkdir $folder && cd $_

printf "\n>>> Create a demo git repo show simple rename heuristics:"
printf "\n"
git init
git config core.safecrlf false

printf "\n>>> Add a couple of small files to rename:"
printf "\n"
echo abcdefg > file1
cp file1 file2
git add file1 file2
git commit -m "Add a couple of small files"

printf "\n>>> Rename via git mv takes one line to rename and stage:"
printf "\n>>> git mv file1 rename-via-git-mv"
printf "\n"
git mv file1 rename-via-git-mv

printf "\n>>> Rename via simple mv takes three lines to rename and stage:"
printf "\n>>> mv file2 rename-via-bash-mv"
printf "\n>>> git add file2              # Add deleted file"
printf "\n>>> git add rename-via-bash-mv # Add new (moved) file"
printf "\n"
mv file2 rename-via-bash-mv
git add file2
git add rename-via-bash-mv

printf "\n>>> git status shows that git detects both as renames:"
printf "\n"
git status

printf "\n>>> Conclusion: git renames ARE implicit, and are determined purely heuristically. Research on Google backs this up."
printf "\n\n"
