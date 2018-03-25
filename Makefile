OUTPUTFILES = \
	outline.pdf \
	interim.pdf \
	final.pdf

HEADERFILES = \
	header-header-footer.tex \
	header-titlepage.tex

BEFOREFILES = \
	before-newpager.tex

FILTERS = \
	pandoc-crossref \
	pandoc-citeproc \

PANDOC = pandoc

PANDOCFILTERPARAMS = \
	$(addprefix -F ,$(FILTERS))

PANDOCHEADERFILEPARAMS = \
	$(addprefix -H ,$(HEADERFILES))

PANDOCBEFOREFILEPARAMS = \
	$(addprefix -B ,$(BEFOREFILES))

PANDOCPARAMS = \
	--number-sections \
	$(PANDOCFILTERPARAMS)\
	$(PANDOCHEADERFILEPARAMS) \
	$(PANDOCBEFOREFILEPARAMS)

ADDITIONALDEPS = \
	references.bib \
	$(wildcard images/*) \
	$(HEADERFILES) \
	$(BEFOREFILES)

.PHONY: all
all: $(OUTPUTFILES)

outline.pdf: outline.md $(ADDITIONALDEPS)
	$(PANDOC) $(PANDOCPARAMS) outline.md -s -o outline.pdf

interim.pdf: interim.md $(ADDITIONALDEPS)
	$(PANDOC) $(PANDOCPARAMS) interim.md -s -o interim.pdf

final.pdf: final.md $(ADDITIONALDEPS)
	$(PANDOC) $(PANDOCPARAMS) final.md -s -o final.pdf

.PHONY: clean cleanall
clean:
	$(RM) -r tex2pdf.*/

cleanall:
	$(RM) $(OUTPUTFILES)
