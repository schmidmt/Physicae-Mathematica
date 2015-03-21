#!/usr/bin/make -f

.default: build

.phony: build
build:
	pdflatex -shell-escape physicae
	makeindex physicae.idx
	pdflatex -shell-escape physicae
	./mkbibs.sh || true
	pdflatex -shell-escape physicae
	makeindex physicae.nlo -s nomencl.ist -o physicae.nls
	makeindex physicae.idx
	pdflatex -shell-escape physicae

.phony: clean
clean:
	find . -iname "*.aux" -exec rm {} \;
	find . -iname "*.bak" -exec rm {} \;
	rm -f physicae.dvi physicae.pdf physicae.ind
	find . -iname "*.log" -exec rm {} \;
	rm -f physicae.lot physicae.lof physicae.idx physicae.ind physicae.toc physicae.ilg bu1.blg physicae.bbl
	rm -f bu?.bbl bu?.blg physicae.tdo physicae.out physicae.nlo physicae.nls physicae.blg
	rm -f solns_temp.tex

.phony: upload
upload:
	rsync -avP physicae.pdf schmidmt.com:public_html/physicae/physicae-current.pdf

.phony: watch 
watch:
	while find . -name '*.tex' | inotifywait --fromfile -; do make; done
