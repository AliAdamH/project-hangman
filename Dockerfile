FROM ruby:3.3.4-slim

WORKDIR /usr/src/app

COPY . .

CMD ["ruby", "hangman.rb"]

