HUGO_VERSION=0.89.4

default: all

clean:
	rm -rfv *.html *.xml about* blog categories code css img links tags page source/public/*

generate:
	docker run -it --rm --name=hugo-build \
		-v ${PWD}/source:/home/iaroki/blog \
		iaroki/hugo:$(HUGO_VERSION)

serve:
	docker run -it --rm --name=hugo-serve \
	-v ${PWD}/source:/home/iaroki/blog \
	-p 1313:1313 \
	iaroki/hugo:$(HUGO_VERSION) \
	hugo server --bind 0.0.0.0 -b http://192.168.109.131:1313

update:
	mv -v source/public/* .

all: clean generate update
