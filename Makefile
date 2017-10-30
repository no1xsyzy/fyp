PDFMIDSUFFIX = .aux -blx.bib .bib .bbl .blg .log .out .run.xml .tex

.PHONY: all
all: outline.pdf

outline.tex: outline.md
	pandoc --biblatex outline.tex -o outline.pdf

outline.pdf: cleanoutlinepdf outline.tex outline.bib
	pdflatex outline
	bibtex outline
	pdflatex outline
	pdflatex outline

outline.bib: reactivemanifesto.bib

.PHONY: cleanoutlinepdf clean
cleanoutlinepdf:
	$(RM) $(addprefix outline,$(PDFMIDSUFFIX))

cleanpdf: cleanoutlinepdf

clean: cleanpdf

cleanoutlinepdfall: cleanoutlinepdf
	$(RM) outline.pdf

cleanpdfall: cleanoutlinepdfall

cleanall: cleanpdfall
