# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 5.2.5
* System dependencies look gemfile
* Database : postgrsql
* Deployment instructions

How to deploy on heroku
Deployment on heroku follows some steps describe below.

##Creation of the app on heroku
Just do on the terminal these commands
<code>
  $ heroku login
  $ heroku create
</code>
##Change the stack because we use ruby version 2.6.5
<code>
  $ heroku buildpacks:set heroku/ruby
  $ heroku buildpacks:add --index 1 heroku/nodejs
  $ heroku stack:set heroku-18
</code>
##Compile the app and push it on heroku
<code>
  $ rails assets:precompile RAILS_ENV=production
  $ git add -A
  $ git commit -m "message"
  $ git push heroku master
</code>
##Migrate database and open app link
<code>
  $ heroku run rails db:migrate
  $ heroku open
</code>

List of gems required
<code>
  gem 'rails', '~> 5.2.6'
  gem 'pg', '>= 0.18', '< 2.0'
  gem 'puma', '~> 3.11'
  gem 'sass-rails', '~> 5.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.2'
  gem 'turbolinks', '~> 5'
  gem 'jbuilder', '~> 2.5'
</code>
