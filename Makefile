#!/usr/bin/make -f

.PHONY: physicae.pdf all clean

all: physicae.pdf

physicae.pdf: physicae.tex
	latexmk -pdf -pdflatex="pdflatex -shell-escape -interactive=nonstopmode" -use-make physicae.tex

clean:
	latexmk -CA
