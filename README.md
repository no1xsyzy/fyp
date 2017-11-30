In one-sentence
====

Interim report of my Final Year Project

Requirements
====

* Make (GNU Make)
* `pandoc`
* `pandoc-crossref`
* any LaTeX engine (with standard packages)
* To view the output, any pdf reader (modern  web browser will work)

Make
====

Run in shell (Bash or PowerShell):
```bash
# Clean middle outputs
make clean

# Clean all outputs
make clean

# Make the outline.pdf
make outline.pdf

# Make the interim report
make interim.pdf
```

Structure
====

* [outline.md](outline.md) is the outline
* [interim.md](interim.md) is the main interim report
* [Makefile](Makefile) is the building system
* [iso690-numeric-en.csl](iso690-numeric-en.csl) copied from [CitationStyles.org](http://citationstyles.org)'s Github repository under CC BY-SA 3.0 license
* `references.bib` is reference file.
* `ljmu.jpg` is the LJMU logo (used in title page)
* `plan.png` is the plan (screenshot from MS Project)
* `header-*.tex` are headers for such purposes
