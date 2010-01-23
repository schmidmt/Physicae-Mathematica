#!/bin/csh
foreach auxfile (bu*.aux)
	echo bibtex `basename $auxfile .aux`
	bibtex `basename $auxfile .aux`
end
