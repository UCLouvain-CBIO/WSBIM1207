all:
	make book
	make ./docs/informations.html

book:
	/opt/Rold/bin/R -e 'bookdown::render_book(".", output_dir = "docs")'

./docs/informations.html: ./notes/informations.Rmd
	/opt/Rold/bin/R -e 'rmarkdown::render("./notes/informations.Rmd")'
	mv notes/informations.html docs/.
