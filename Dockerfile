FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y nodejs libsqlite3-dev

WORKDIR /usr/app

COPY Gemfile .
COPY package.json .
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN bundle install

COPY . .

RUN puma -F puma.rb start
