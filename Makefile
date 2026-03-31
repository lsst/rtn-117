DOCTYPE = RTN
DOCNUMBER = 117
DOCNAME = $(DOCTYPE)-$(DOCNUMBER)

tex = $(filter-out $(wildcard *acronyms.tex) , $(wildcard *.tex))

GITVERSION := $(shell git log -1 --date=short --pretty=%h)
GITDATE := $(shell git log -1 --date=short --pretty=%ad)
GITSTATUS := $(shell git status --porcelain)
ifneq "$(GITSTATUS)" ""
	GITDIRTY = -dirty
endif

export TEXMFHOME ?= lsst-texmf/texmf

figures/calib-dependency.pdf: figures/calib-dependency.tex
	cd figures && pdflatex -interaction=nonstopmode calib-dependency.tex

# lineno.sty is TeX Live's lineno (ISO-8859-1) converted to UTF-8 for XeLaTeX; refresh with:
#   iconv -f ISO-8859-1 -t UTF-8 "$(shell kpsewhich lineno.sty)" > lineno.sty
$(DOCNAME).pdf: $(tex) local.bib authors.tex lineno.sty .latexmkrc figures/calib-dependency.pdf
	latexmk -bibtex -xelatex -f $(DOCNAME)

authors.tex:  authors.yaml
	python3 $(TEXMFHOME)/../bin/db2authors.py -m aas7 > authors.tex

.PHONY: clean
clean:
	latexmk -c
	rm -f $(DOCNAME).bbl
	rm -f $(DOCNAME).pdf
	rm -f meta.tex
	rm -f authors.tex

.FORCE:
