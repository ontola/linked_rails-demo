# README

This is a demo for a new [LinkedRails](https://github.com/ontola/linked_rails/) app. This demo was created by following these steps:

Each step described here is executed in a separate commit in this repo.

##Setup
* Create a fresh rails app:

  ```bash
  $ rails new demo_app --api
  ```


* Add the linked_rails and linked_rails-auth gems to the Gemfile:

    ```ruby
    gem 'linked_rails'
    gem 'linked_rails-auth'
    ```

* Install devise

  Install devise using their [instructions](https://github.com/heartcombo/devise#getting-started):

  ```bash
  $ rails g devise:install
  ```

  Add the following to `development.rb`
  ```ruby
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  ```
  Ignore the other instructions.

  ```bash
  $ rails g devise User
  ```
  ```bash
  $ rails db:migrate
  ```

* Install doorkeeper

  Install doorkeeper using their [instructions](https://doorkeeper.gitbook.io/guides/ruby-on-rails/getting-started):

  ```bash
  $ rails g doorkeeper:install
  ```
  ```bash
  $ rails g doorkeeper:migration
  ```

  Before continuing, we need to edit the created migration. The resource_owner_id of access tokens can be string when creating a token for a guest user:
  Replace
  ```ruby
  t.references :resource_owner, index: true
  ```
  with
  ```ruby
  t.string :resource_owner_id, index: true
  ```

  Then run:
  ```bash
  $ rails db:migrate
  ```


* Install linked_rails

  ```bash
  $ rails g linked_rails:install
  $ rails g linked_rails:auth:install
  $ bin/rails db:migrate RAILS_ENV=development
  ```

You are now all set to create your linked data application!

##Create a todo app

* Generate your first model

  ```bash
  $ bin/rails generate linked_rails:model thing name:string text:text
  ```

