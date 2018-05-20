# export version='0.0.5'
# export DOCKER_ID_USER="opstudio"
# docker build -t opstudio/demo .
#
# docker build -t opstudio/demo:0.0.5 .
# docker tag opstudio/demo:0.0.5 demo:latest
# docker push opstudio/demo:0.0.5
# docker push demo:latest

# docker run --rm -it opstudio/demo bash
FROM ruby:2.5.1

MAINTAINER Andrii Aheiev <a.ageyev@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_8.x -o /tmp/nodesource_setup8.sh \
    && chmod +x /tmp/nodesource_setup8.sh \
    && sh /tmp/nodesource_setup8.sh

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client-9.6 \
		nodejs \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY . /app/

RUN bundle install
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD bundle exec puma -C config/puma.rb
