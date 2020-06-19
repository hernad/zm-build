#!/bin/bash

cd ..
for f in zm-* ; do ( echo $f ; echo ===========================================================; cd $f ; git status ; cd ..) ; done

cd zm-build
