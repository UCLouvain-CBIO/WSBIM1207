all:
	make book

book:
	R -e 'bookdown::render_book(".", output_dir = "docs")'

./docs/informations.html: ./notes/informations.Rmd
	R -e 'rmarkdown::render("./notes/informations.Rmd")'
	mv notes/informations.html docs/.


./docs/slides.html: ./notes/slides.Rmd
	Rscript -e "rmarkdown::pandoc_available()"
	Rscript -e "rmarkdown::render('./notes/slides.Rmd', output_format = 'xaringan::moon_reader')"
	mv notes/slides.html docs/.
	rm -rf docs/slides_files
	mv notes/slides_files docs/.
	cp notes/xaringan-themer.css docs/.
