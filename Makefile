all:
	Rscript --quiet _render.R

gitbook:
	Rscript --quiet _render.R "bookdown::gitbook"
