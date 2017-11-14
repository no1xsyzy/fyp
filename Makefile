OUTPUTFILES = outline.pdf interim.pdf
CITATIONS = reactivemanifesto.bib whatisreactiveprogramming.bib frp.bib rpvsrs.bib microservices.bib reactivemicroservice.bib cloudcomputing.bib

.PHONY: all
all: outline.pdf

outline.pdf: outline.md $(CITATIONS)
	pandoc --filter pandoc-citeproc outline.md -s -o outline.pdf

interim.pdf: interim.md $(CITATIONS)
	pandoc --filter pandoc-citeproc interim.md -s -o interim.pdf

.PHONY: clean cleanall
clean:
	$(RM) -r tex2pdf.*/

cleanall:
	$(RM) $(OUTPUTFILES)
