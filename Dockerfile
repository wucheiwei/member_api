FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /member_systems
WORKDIR /member_systems
COPY Gemfile /member_systems/Gemfile
COPY Gemfile.lock /member_systems/Gemfile.lock

RUN bundle install
COPY . /member_systems

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]