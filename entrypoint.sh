#!/bin/sh -l

echo "Hello $1"
env
tree $GITHUB_WORKSPACE
touch $GITHUB_WORKSPACE/inside
time=$(date)
echo "::set-output name=time::$time"