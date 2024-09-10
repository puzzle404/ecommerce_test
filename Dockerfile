FROM ruby:3.0.0-alpine

RUN apk add --no-cache --update build-base git linux-headers postgresql-dev tzdata

WORKDIR /app

RUN gem install bundler rails

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
