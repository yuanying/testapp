FROM ruby:3.1-buster
WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
EXPOSE 4567

COPY . /app

CMD bundle exec ruby index.rb
