default :
	pdflatex physicae
	makeindex physicae.idx
	pdflatex physicae
	./mkbibs.sh || true
	pdflatex physicae
	makeindex physicae.nlo -s nomencl.ist -o physicae.nls
	makeindex physicae.idx
	pdflatex physicae

src :
	$(default)
	scp physicae.pdf rtt:public_html/.

clean :
	find . -iname "*.aux" -exec rm {} \;
	find . -iname "*.bak" -exec rm {} \;
	rm -f physicae.dvi physicae.pdf physicae.ind
	find . -iname "*.log" -exec rm {} \;
	rm -f physicae.lot physicae.lof physicae.idx physicae.ind physicae.toc physicae.ilg bu1.blg physicae.bbl
	rm -f bu?.bbl bu?.blg physicae.tdo physicae.out physicae.nlo physicae.nls physicae.blg
	rm -f solns_temp.tex
