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

# factory_bot_rails 

[factory_bot][fb] is a fixtures replacement with a straightforward definition
syntax, support for multiple build strategies (saved instances, unsaved
instances, attribute hashes, and stubbed objects), and support for multiple
factories for the same class (`user`, `admin_user`, and so on), including factory
inheritance.

### Transitioning from factory\_girl\_rails?

Check out the [guide](https://github.com/thoughtbot/factory_bot/blob/4-9-0-stable/UPGRADE_FROM_FACTORY_GIRL.md).

## Rails

factory\_bot\_rails provides Rails integration for [factory_bot][fb].

Supported Rails versions are listed in [`Appraisals`](Appraisals). Supported
Ruby versions are listed in [`.travis.yml`](.travis.yml).

## Download

Github: http://github.com/thoughtbot/factory_bot_rails

Gem:

    $ gem install factory_bot_rails

## Configuration

Add `factory_bot_rails` to your Gemfile in both the test and development groups:

```ruby
group :development, :test do
  gem 'factory_bot_rails'
end
