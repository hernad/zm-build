#!/bin/bash


for REPOS in  zm-admin-console zm-web-client zm-zimlets zm-mailbox
do
if [ x$REPOS != x ] ; then
  echo removing ../$REPOS
  rm -rf ../$REPOS 
fi
done

