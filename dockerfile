FROM ruby:2.5.3-stretch

LABEL "name"="triptych"
LABEL "version"="0.0.1"
LABEL "description"="Ttriptych personal aggregator image."

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /triptych
WORKDIR /triptych
COPY Gemfile /triptych/Gemfile
COPY Gemfile.lock /triptych/Gemfile.lock
RUN bundle install
COPY . /triptych
