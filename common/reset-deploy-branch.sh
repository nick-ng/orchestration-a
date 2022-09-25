# cd into a git directory

deploy_branch=deploy-branch

git fetch -p

echo "Getting default branch name"
origin_name=$(git remote show)
default_branch=$(git remote show $origin_name | sed -n '/HEAD branch/s/.*: //p')
echo "Default branch is $default_branch"

git checkout $default_branch

git branch -D $deploy_branch
git branch -vv | grep ": gone]" | awk "{print \$1}" | xargs git branch -D

git pull

git checkout -b $deploy_branch
