.PHONY: all build check document test

all: document build check

build: document
	R CMD build .

check: build
	R CMD check papr*tar.gz

clean:
	-rm -f papr*tar.gz
	-rm -fr papr.Rcheck
	-rm -rf src/*.o src/*.so

document:
	Rscript -e 'devtools::document()'

test:
	Rscript -e 'devtools::test()'

lintr:
	R --slave -e "lintr::lint_package()"

install: clean
	R CMD INSTALL .
