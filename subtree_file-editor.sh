#!/usr/bin/env bash

repo_url="https://github.com/fenix-hub/godot-engine.file-editor.git"
repo_branch="master"
target_branch="master"
extraction_folder="addons/file-editor"
extraction_target="file-editor"

git remote add -f -t ${repo_branch} --no-tags temp-repo ${repo_url}

git checkout temp-repo/${repo_branch}
git subtree split -b temp-branch -P ${extraction_folder}
git checkout ${target_branch}
git subtree merge --squash -P addons/${extraction_target} temp-branch
git branch -D temp-branch

git remote remove temp-repo
