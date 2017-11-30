OUTPUTFILES = outline.pdf interim.pdf

.PHONY: all
all: outline.pdf

outline.pdf: outline.md references.bib header.tex
	pandoc --filter pandoc-citeproc outline.md -H header.tex -s -o outline.pdf

interim.pdf: interim.md references.bib header.tex
	pandoc --filter pandoc-citeproc interim.md -H header.tex -s -o interim.pdf

.PHONY: clean cleanall
clean:
	$(RM) -r tex2pdf.*/

cleanall:
	$(RM) $(OUTPUTFILES)
