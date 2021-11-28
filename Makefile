HUGO_VERSION=0.89.4

default: all

clean:
	rm -rfv *.html *.xml about* blog categories code css img links tags

generate:
	docker run -it --rm --name=hugo -v ${PWD}/source:/home/iaroki/blog iaroki/hugo:$(HUGO_VERSION)

update:
	mv -v source/public/* .

all: clean generate update
