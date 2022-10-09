FROM ruby:3.1-buster
WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install

CMD bundle exec ruby index.rb
