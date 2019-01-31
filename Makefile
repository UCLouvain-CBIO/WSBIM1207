all:
	make book
	make ./docs/informations.html

book:
	R -e 'bookdown::render_book(".", output_dir = "docs")'

./docs/informations.html: informations.md
	R -e 'rmarkdown::render("informations.md", output_format = rmarkdown::html_document())'
	mv informations.html docs/.