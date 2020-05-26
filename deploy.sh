#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Pull latest version of website/public folder
cd public
git checkout master
git pull -f
cd ..

# Build the project.
Rscript -e "blogdown::build_site()"

# Add changes to public folder
cd public
git add .
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
msg="$1"
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
