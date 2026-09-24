DOCTYPE = RTN
DOCNUMBER = 117
DOCNAME = $(DOCTYPE)-$(DOCNUMBER)

tex = $(filter-out $(wildcard *acronyms.tex) , $(wildcard *.tex))
section_tex = $(wildcard sections/*.tex) $(wildcard sections/*/*.tex)

GITVERSION := $(shell git log -1 --date=short --pretty=%h)
GITDATE := $(shell git log -1 --date=short --pretty=%ad)
GITSTATUS := $(shell git status --porcelain)
ifneq "$(GITSTATUS)" ""
	GITDIRTY = -dirty
endif

export TEXMFHOME ?= lsst-texmf/texmf

# Default goal: full technote. Figure PDFs are prerequisites and are built first when
# missing or older than their sources.
$(DOCNAME).pdf: $(tex) $(section_tex) local.bib authors.tex figures/calib-dependency.pdf figures/isr-pipeline.pdf figures/calibration_boxes_detector_model.pdf
	latexmk -bibtex -xelatex -f $(DOCNAME)

figures/calib-dependency.pdf: figures/src/to-make-calib-dependency.tex
	cd figures/src && pdflatex -interaction=nonstopmode -halt-on-error -jobname=calib-dependency -output-directory=.. to-make-calib-dependency.tex

figures/isr-pipeline.pdf: figures/src/to-make-isr-pipeline.tex
	cd figures/src && pdflatex -interaction=nonstopmode -halt-on-error -jobname=isr-pipeline -output-directory=.. to-make-isr-pipeline.tex

figures/calibration_boxes_detector_model.pdf: figures/src/to-make-calibration-boxes-detector-model.tex
	cd figures/src && pdflatex -interaction=nonstopmode -halt-on-error -jobname=calibration_boxes_detector_model -output-directory=.. to-make-calibration-boxes-detector-model.tex

authors.tex: authors.yaml
	python3 $(TEXMFHOME)/../bin/db2authors.py -m aas7 > authors.tex
	python3 bin/fix-authors-metadata.py authors.tex

.PHONY: clean
clean:
	latexmk -c
	rm -f $(DOCNAME).bbl
	rm -f $(DOCNAME).pdf
	rm -f meta.tex
	rm -f authors.tex
	rm -f figures/calib-dependency.pdf figures/calib-dependency.aux figures/calib-dependency.log
	rm -f figures/isr-pipeline.pdf figures/isr-pipeline.aux figures/isr-pipeline.log
	rm -f figures/to-make-calib-dependency.aux figures/to-make-calib-dependency.log figures/to-make-calib-dependency.pdf
	rm -f figures/calibration_boxes_detector_model.pdf figures/calibration_boxes_detector_model.aux figures/calibration_boxes_detector_model.log

.FORCE:
