# TODO This should build the Production Image
FROM ruby:2.5.3-stretch

LABEL "name"="triptych" \
    "description"="Triptych: a personal aggregator" \
    "version"="0.3.0"

# Install dependencies: node, yarn, etc
RUN curl -sL https://deb.nodesource.com/setup_10.x | /bin/bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y build-essential libpq-dev apt-transport-https ca-certificates tzdata nodejs yarn dos2unix \
    && gem install rails \
    && gem install rake \
    && gem install bundler

RUN mkdir /triptych
WORKDIR /triptych
COPY Gemfile Gemfile.lock package.json yarn.lock /triptych/
RUN bundle install \
    && yarn install
COPY . /triptych

EXPOSE 4000

# Production ready compilation
RUN rake webpacker:compile
RUN rake assets:precompile
