FROM ruby:2.5.3-stretch

LABEL "name"="triptych"
LABEL "version"="0.1.1"
LABEL "description"="Triptych: a personal aggregator"

# Install dependencies: node, yarn, etc
RUN curl -sL https://deb.nodesource.com/setup_10.x | /bin/bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y build-essential libpq-dev apt-transport-https ca-certificates tzdata nodejs yarn \
    && gem install rails \
    && gem install rake \
    && gem install bundler

RUN mkdir /triptych
WORKDIR /triptych
COPY Gemfile Gemfile.lock package.json yarn.lock /triptych/
RUN bundle install \
    && yarn install
COPY . /triptych
