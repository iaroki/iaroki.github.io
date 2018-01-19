#!/bin/bash

rm -rf *.html
rm -rf author category tag theme
docker run -it --rm -v $PWD:/home/iaroki/blog pelican content
rm -rf __pycache__
