#!/bin/bash

for i in `find . -iname "*.tex"`; do
    aspell -c ${i}
done
