# export version=''
# export DOCKER_ID_USER="opstudio"
# docker build -t opstudio/demo .
#
# docker build -t opstudio/demo:$version .
# docker tag demo:$version demo:latest
# docker tag cloudcc-app:1.0.19 $DOCKER_ID_USER/demo:$version
# docker tag cloudcc-app:1.0.19 $DOCKER_ID_USER/demo:latest
# docker run --rm -it opstudio/demo bash
# docker run --rm -it -p 3000:3000 opstudio/demo bash
# docker push $DOCKER_ID_USER/demo:$version
# docker push $DOCKER_ID_USER/demo:latest

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
