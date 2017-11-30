OUTPUTFILES = \
	outline.pdf \
	interim.pdf

PANDOC = pandoc

PANDOCPARAM = \
	-F pandoc-crossref \
	-F pandoc-citeproc \
	-H header.tex

ADDITIONALDEPS = \
	references.bib \
	header.tex

.PHONY: all
all: $(OUTPUTFILES)

outline.pdf: outline.md $(ADDITIONALDEPS)
	$(PANDOC) $(PANDOCPARAM) outline.md -s -o outline.pdf

interim.pdf: interim.md $(ADDITIONALDEPS)
	$(PANDOC) $(PANDOCPARAM) interim.md -s -o interim.pdf

.PHONY: clean cleanall
clean:
	$(RM) -r tex2pdf.*/

cleanall:
	$(RM) $(OUTPUTFILES)
