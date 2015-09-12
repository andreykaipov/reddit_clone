source 'https://rubygems.org'

gem 'figaro'
gem 'rails',                  '4.2.2'
gem 'bcrypt',                 '3.1.7'   #to encrypt passwords and tokens
gem 'faker',                   '1.4.2'  #to seed the database quickly
gem 'friendly_id'                       #to use user's names in urls
gem 'paperclip',              "~> 4.3"  #for profile pics and img upload
gem 'aws-sdk', '< 2.0'
gem 'will_paginate',           '3.0.7'  #bootstrap thing for paginations
gem 'bootstrap-will_paginate', '0.0.10' #same thing i guess
gem 'bootstrap-sass',         '3.2.0.0' #sassy css
gem 'sass-rails',             '5.0.2'   #same thing i guess
gem 'uglifier',               '2.5.3'
gem 'coffee-rails',           '4.1.0'
gem 'jquery-rails',           '4.0.3'
gem 'turbolinks',             '2.3.0'
gem 'jbuilder',               '2.2.3'
gem 'sdoc',                   '0.4.0', group: :doc

group :development, :test do
  gem 'sqlite3',     '1.3.9'
  gem 'byebug',      '3.4.0'
  gem 'web-console', '2.0.0.beta3'
  gem 'spring',      '1.1.3'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'puma',           '2.11.1'
end