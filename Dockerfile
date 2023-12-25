FROM ruby:2.7.6

RUN apt-get update -qq && apt-get install -y postgresql-client

WORKDIR /app
COPY Gemfile* ./
RUN gem install bundler -v 2.4.22
RUN bundle install

COPY . .

EXPOSE 3000
