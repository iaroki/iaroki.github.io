#!/bin/bash

echo "==> Generating content with Docker..."
docker run -it --rm --name=hugo -v $PWD:/home/iaroki/blog iaroki/hugo
echo "==> DONE!"
