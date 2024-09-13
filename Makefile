LATEX = pdflatex
BIB = bibtex
MAIN = WaggenerSBEC2024

all: $(MAIN).pdf

%.pdf: %.tex
	$(LATEX) -interaction=nonstopmode -shell-escape $(MAIN) || true
	$(BIB) $(MAIN)
	$(LATEX) -interaction=nonstopmode -shell-escape $(MAIN) || true
	$(LATEX) -interaction=nonstopmode -shell-escape $(MAIN)

clean:
	# X: Only remove files that match .gitignore (don't remove untracked files)
	# d: Also delete entire directories that match .gitignore
	# f: Actually delete instead of warn
	git clean -Xdf

reset:
	$(MAKE) clean
	$(MAKE) docker