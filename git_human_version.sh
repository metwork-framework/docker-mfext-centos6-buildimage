#!/bin/bash

function usage() {
    echo "Guess a version with git branch and git number of commits in this branch (a git checkout is needed)"
    echo "The git revision is also added"
    echo ""
    echo "usage: git_human_version.sh [--just-branch] [--no-git-commit-revision]"
    echo ""
    echo "options:"
    echo "  --just-branch: return only the branch name"
    echo "  --no-git-commit-revision: do not add the git revision"
}

JUST_BRANCH=0
COMMIT_REVISION=1
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
       -h|--help)
           usage
           exit 0;;
       --just-branch)
           JUST_BRANCH=1
           shift;;
       --no-git-commit-revision)
           COMMIT_REVISION=0
           shift;;
       *)
           usage
           exit 1;;
    esac
done

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null |sed 's/-/_/g')
if test "${BRANCH}" = ""; then
    BRANCH=unknown
fi
if test "${JUST_BRANCH}" = "1"; then
    echo "${BRANCH}"
    exit 0
fi

NUMBER_OF_COMMITS=$(git rev-list HEAD 2>/dev/null |wc -l)

if test "${COMMIT_REVISION}" = "0"; then
    echo "${BRANCH}.${NUMBER_OF_COMMITS}"
    exit 0
fi

COMMIT=$(git rev-parse --short HEAD 2>/dev/null)
echo "${BRANCH}.${NUMBER_OF_COMMITS}.${COMMIT}"
