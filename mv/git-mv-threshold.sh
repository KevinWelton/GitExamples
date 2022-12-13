#!/bin/sh

folder="git-mv-threshold"

if [ -d "./$folder" ]; then
    rm -rf $folder
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

printf "\n>>> Append files: file1 within rename threshold, file2 outside threshold."
printf "\n"
echo defghij >> file1
echo defghijk >> file2

printf "\n>>> Rename via git mv takes one line to rename and stage:"
printf "\n>>> git mv file1 rename-file-1"
printf "\n>>> git mv file2 rename-file-2"
printf "\n>>> git add *"
printf "\n"
git mv file1 rename-file1
git mv file2 rename-file2
git add *

printf "\n>>> git status shows that git detects file1 as a rename, but file2 as a new file:"
printf "\n"
git status

printf "\n>>> Conclusion: git renames ARE implicit, and are determined purely heuristically. Research on Google backs this up."
printf "\n\n"
