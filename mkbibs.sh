#!/bin/bash
for auxfile in bu*.aux; do
	echo "bibtex `basename $auxfile .aux`"
	bibtex `basename $auxfile .aux`
done
