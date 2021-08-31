FROM ruby:3.0.2-alpine3.14

ENV DEV_PACKAGES="build-base ruby-dev zlib-dev libxml2-dev npm libxslt-dev tzdata yaml-dev sqlite-dev" \
 RAILS_PACKAGES="nodejs"

RUN apk --update --upgrade add $RAILS_PACKAGES $DEV_PACKAGES

RUN npm install -g yarn
 
RUN mkdir -p /app
WORKDIR /app


COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install  --without production --jobs 20 --retry 5

COPY . ./

RUN yarn install
RUN bundle install

RUN ./bin/rails db:drop && ./bin/rails db:setup

EXPOSE 3000
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
