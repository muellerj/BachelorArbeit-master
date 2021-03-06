all: WissenschaftlicheArbeit.pdf Deckblatt/Deckblatt.pdf

Deckblatt/Deckblatt.pdf: Deckblatt/Deckblatt.tex
	pdflatex -output-directory=Deckblatt Deckblatt/Deckblatt.tex

WissenschaftlicheArbeit.pdf: WissenschaftlicheArbeit.tex \
							 Tex/*.tex \
							 Bib.bib \
							 Ressourcen/*.*
	pdflatex WissenschaftlicheArbeit.tex
	biber WissenschaftlicheArbeit
	makeglossaries WissenschaftlicheArbeit
	pdflatex WissenschaftlicheArbeit.tex

clean:
	rm -rf Ressourcen/*.aux Ressourcen/*.bbl Ressourcen/*.log Ressourcen/*.fls Ressourcen/*.blg
	rm -rf *.acn *.acr *.alg *.aux *.bbl *.bcf *.blg *.dvi *.fdb_latexmk *.fls *.glg *.glo *.gls
	rm -rf *.ist *.lof *.log *.lot *.out *.toc *.xdy *.run.xml
	rm -rf Deckblatt/*.log Deckblatt/*.aux

.PHONY: clean
