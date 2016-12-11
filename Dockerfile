FROM ruby:latest
MAINTAINER digitaldrummerj@gmail.com

VOLUME /src
EXPOSE 4000

ONBUILD WORKDIR /src
#ONBUILD ADD Gemfile Gemfile
#ONBUILD ADD Gemfile.lock Gemfile.lock 
ONBUILD RUN bundle install

ONBUILD ENTRYPOINT ["/bin/sh", "-c"] 
ONBUILD CMD ["bundle exec jekyll serve --config _config.yml,_configdev.yml --port 4000 --host 0.0.0.0 --drafts --force_polling"]

