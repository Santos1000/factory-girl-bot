# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

factory_bot_rails Build Status Code Climate Gem Version

factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for multiple factories for the same class (user, admin_user, and so on), including factory inheritance.
Transitioning from factory_girl_rails?

Check out the guide.
Rails

factory_bot_rails provides Rails integration for factory_bot.

Supported Rails versions are listed in Appraisals. Supported Ruby versions are listed in .travis.yml.
Download

Github: http://github.com/thoughtbot/factory_bot_rails

Gem:

$ gem install factory_bot_rails

Configuration

Add factory_bot_rails to your Gemfile in both the test and development groups:

group :development, :test do
  gem 'factory_bot_rails'
end

You may want to configure your test suite to include factory_bot methods; see configuration.
