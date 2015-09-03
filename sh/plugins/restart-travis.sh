#!/usr/bin/env bash

_current_github_repo () {
  local url username reponame
  url=`git remote -v | grep '^origin' | sed 1q | awk '{print $2}'`
  echo $url | awk 'BEGIN {FS="/"} {print $4"/"$5}' | sed 's/\.git$//'
}

restart_failed_travis_on_pr_branch () {
  github_repo=`_current_github_repo`
  failed_job_ids=(`travis show $@ | grep '^#.* \(failed\|errored\):' | sed 's/^#//' | awk '{print $1}'`)
  for job_id in $failed_job_ids; do
    echo "\"restart travis $github_repo $job_id\" -> #travis at jsk-robotics.slack.com"
    echo "restart travis $github_repo $job_id" | slacker -c travis
  done
}