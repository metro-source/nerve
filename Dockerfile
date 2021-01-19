FROM ruby

RUN apt-get update -qq && apt-get install -y nodejs libsqlite3-dev

WORKDIR /usr/app

COPY Gemfile .
COPY Gemfile.lock .
COPY package.json .

RUN bundle install

COPY . .

RUN puma -F puma.rb start
