.PHONY: all
all: outline.pdf

outline.pdf: outline.md
	pandoc --filter pandoc-citeproc outline.md -o outline.pdf