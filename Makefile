ifndef MAIN
	MAIN= $(shell find ./ -maxdepth 1 -type f -name "*.tex" -exec basename {} \;)
endif
FIGURES  += $(shell find figures/ -name '*.tex' -o -name '*.pdf')
BIBFILES += $(shell find ./ -maxdepth 1 -type f -name "*.bib")
OTHER += zebra-latex-goodies/zebra.sty
DEP = $(FIGURES) $(BIBFILES) $(OTHER)
TRG = $(MAIN:%.tex=%.pdf)

LATEXMK = latexmk
# use pdflatex
LATEXMKOPT = -pdf
# use xelatex
# LATEXMKOPT = -xelatex

all: $(TRG)

$(TRG): $(MAIN) $(DEP)
	$(LATEXMK) $(LATEXMKOPT) $(MAIN)

clean:
	$(LATEXMK) -C $(MAIN)

# for mac
view: $(TRG)
	open $(TRG)

.PHONY: all view clean
