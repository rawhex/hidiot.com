FROM jekyll/jekyll:latest
MAINTAINER Aidan Mitchell <aidan@rawhex.com>

COPY . /srv/jekyll
WORKDIR /srv/jekyll

CMD jekyll serve
