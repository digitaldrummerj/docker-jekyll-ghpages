FROM ruby:2.1
MAINTAINER digitaldrummerj@gmail.com

RUN apt-get update \
  && apt-get install -y \
    python-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN gem clean && \
    gem install github-pages && \
    gem install bundler
  

RUN rm -rf /usr/lib/ruby/gems/*/cache/*.gem && \
    rm -rf /var/cache/apk/*

VOLUME /src
EXPOSE 4000

#Copy over the gemfile to a temporary directory and run the install command. 
ONBUILD WORKDIR /tmp
ONBUILD ADD Gemfile Gemfile
ONBUILD ADD Gemfile.lock Gemfile.lock 
ONBUILD RUN bundle install

ONBUILD WORKDIR /src
ONBUILD ENTRYPOINT ["/bin/sh", "-c"] 
ONBUILD CMD ["bundle exec jekyll serve --config _config.yml,_configdev.yml --port 4000 --host 0.0.0.0 --drafts --force_polling"]

