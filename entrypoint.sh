#!/bin/sh -l

echo "Hello $1"
tree /
env
time=$(date)
echo "::set-output name=time::$time"