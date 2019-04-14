# Concurrently

[![Build Status](https://travis-ci.com/BrandonKlotz/concurrently.svg?branch=master)](https://travis-ci.com/BrandonKlotz/concurrently)

An app for Live Question and Answers for Speakers.

Concurrently allows speakers to view data about their content with ease and gain realtime insights about their events.

## Contributing

This is living as a personal project but if there is interest in this becoming Open Source or contributing to it reach out on Twitter @brandonklotz

## Set Up

#### Prerequisites
You will need the following services to run the app:
```
brew install postgresql
brew install redis

brew start postgresql
brew start redis
```

#### The main App
First, set your repository to Ruby `2.5.0`.
If you are using rbenv, from the `concurrently/`:
```
rbenv local 2.5.0
```

Next, install gems and create postgres:
```
> git clone https://github.com/BrandonKlotz/concurrently.git
> bundle install
> bundle exec rake db:create db:migrate
> rails server
```
