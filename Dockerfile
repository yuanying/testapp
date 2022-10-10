FROM ruby:3.1-buster
WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
EXPOSE 4567

COPY . /app

ENTRYPOINT ["bundle", "exec", "ruby", "index.rb"]
CMD ["-o", "0.0.0.0"]
