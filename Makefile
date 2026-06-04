DOCTYPE = RTN
DOCNUMBER = 117
DOCNAME = $(DOCTYPE)-$(DOCNUMBER)

tex = $(filter-out $(wildcard *acronyms.tex) , $(wildcard *.tex))
section_tex = $(wildcard sections/*.tex)

GITVERSION := $(shell git log -1 --date=short --pretty=%h)
GITDATE := $(shell git log -1 --date=short --pretty=%ad)
GITSTATUS := $(shell git status --porcelain)
ifneq "$(GITSTATUS)" ""
	GITDIRTY = -dirty
endif

export TEXMFHOME ?= lsst-texmf/texmf

# Default goal: full technote. Figure PDFs are prerequisites and are built first when
# missing or older than their sources.
$(DOCNAME).pdf: $(tex) $(section_tex) local.bib authors.tex figures/calib-dependency.pdf figures/isr-pipeline.pdf
	latexmk -bibtex -xelatex -f $(DOCNAME)

figures/calib-dependency.pdf: figures/to-make-calib-dependency.tex
	cd figures && pdflatex -interaction=nonstopmode -halt-on-error -jobname=calib-dependency to-make-calib-dependency.tex

figures/isr-pipeline.pdf: figures/to-make-isr-pipeline.tex
	cd figures && pdflatex -interaction=nonstopmode -halt-on-error -jobname=isr-pipeline to-make-isr-pipeline.tex

authors.tex:  authors.yaml
	python3 $(TEXMFHOME)/../bin/db2authors.py -m aas7 > authors.tex

.PHONY: clean
clean:
	latexmk -c
	rm -f $(DOCNAME).bbl
	rm -f $(DOCNAME).pdf
	rm -f meta.tex
	rm -f authors.tex
	rm -f figures/calib-dependency.pdf figures/calib-dependency.aux figures/calib-dependency.log
	rm -f figures/isr-pipeline.pdf figures/isr-pipeline.aux figures/isr-pipeline.log

.FORCE:
