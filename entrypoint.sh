#!/bin/sh -l

echo "Hello $1"
tree /
time=$(date)
echo "::set-output name=time::$time"