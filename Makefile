default :
	pdflatex book
	makeindex book.idx
	pdflatex book
	./mkbibs.sh || true
	pdflatex book
	makeindex book.nlo -s nomencl.ist -o book.nls
	pdflatex book

src :
	$(default)
	scp book.pdf rtt:public_html/.

clean :
	find . -iname "*.aux" -exec rm {} \;
	find . -iname "*.bak" -exec rm {} \;
	rm -f book.dvi book.pdf book.ind
	find . -iname "*.log" -exec rm {} \;
	rm -f book.lot book.lof book.idx book.ind book.toc book.ilg bu1.blg book.bbl
	rm -f bu?.bbl bu?.blg book.tdo book.out book.nlo book.nls book.blg
