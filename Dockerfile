FROM ruby:3.3.3

RUN apt-get update && apt-get install -y build-essential libpq-dev cmake lsb-release

# Install the postgresql client tools
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql-client-12

RUN mkdir -p /app
WORKDIR /app

RUN gem install bundler
COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000
