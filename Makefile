OUTPUTFILES = outline.pdf

.PHONY: all
all: outline.pdf

outline.pandoc: outline.md reactivemanifesto.bib
	pandoc --filter pandoc-citeproc outline.md -s -o outline.pdf

.PHONY: clean cleanall
clean:
	$(RM) -r tex2pdf.*/

cleanall:
	$(RM) $(OUTPUTFILES)
