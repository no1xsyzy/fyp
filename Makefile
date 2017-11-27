OUTPUTFILES = outline.pdf interim.pdf

.PHONY: all
all: outline.pdf

outline.pdf: outline.md references.bib
	pandoc --filter pandoc-citeproc outline.md -s -o outline.pdf

interim.pdf: interim.md references.bib
	pandoc --filter pandoc-citeproc interim.md -s -o interim.pdf

.PHONY: clean cleanall
clean:
	$(RM) -r tex2pdf.*/

cleanall:
	$(RM) $(OUTPUTFILES)
