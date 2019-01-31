all:
	make book
	make ./docs/informations.html

book:
	R -e 'bookdown::render_book(".", output_dir = "docs")'

./docs/informations.html: informations.Rmd
	R -e 'rmarkdown::render("informations.Rmd")'
	mv informations.html docs/.