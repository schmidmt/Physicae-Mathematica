#!/usr/bin/make -f

.PHONY: all clean watch physicae.pdf

all: physicae.pdf

physicae.pdf:
	latexmk -pdf -pdflatex="pdflatex -shell-escape -interactive=nonstopmode" -use-make physicae.tex

clean:
	latexmk -CA

watch:
	while true; do \
		find . -name '*.tex' \
			| xargs inotifywait -e modify -e create -e delete -e delete_self -e attrib -r && \
		${MAKE} physicae.pdf; \
	done
