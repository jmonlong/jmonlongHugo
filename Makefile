MSG?="New changes"

pull:
	git pull
	git submodule update --init --recursive

serve:
	git submodule update --init --recursive
	Rscript -e "blogdown::build_site()"
	Rscript -e "blogdown::serve_site()"

deploy:
	sh deploy.sh $(MSG)


