
# railsのinstallまで完了した後、appの立ち上げ手順

% rails new my-rails-app

% cd my-rails-app

% bundle install 
versionが最新でないために起きるエラーに対してsudo installを繰り返す

% sudo gem install rake
Successfully installed rake-13.2.1
% sudo gem install bigdecimal
Successfully installed bigdecimal-3.1.8
% sudo gem install drb
Successfully installed drb-2.2.1
% sudo gem install strscan
Successfully installed strscan-3.1.0
% sudo gem install io-console 
Successfully installed io-console-0.7.2
% sudo gem install regexp_parser
Successfully installed regexp_parser-2.9.2
% sudo gem install msgpack
Successfully installed msgpack-1.7.2
% sudo gem install bindex
Successfully installed bindex-0.8.1
% sudo gem install public_suffix
Successfully installed public_suffix-5.0.5
% sudo gem install minitest
Successfully installed minitest-5.23.0
% sudo gem install sqlite3
Successfully installed sqlite3-2.0.1-x86_64-darwin
% sudo gem install sprockets
Successfully installed sprockets-4.2.1
% sudo gem install websocket
Successfully installed websocket-1.2.10
% sudo gem install rubyzip
Successfully installed rubyzip-2.3.2
% sudo gem install rexml
Successfully installed rexml-3.2.8
% sudo gem install puma
Successfully installed puma-6.4.2
% sudo gem install reline
Successfully installed reline-0.5.7
% sudo gem install net-smtp
Successfully installed net-smtp-0.5.0
% sudo gem install xpath
Successfully installed xpath-3.2.0
% sudo gem install bootsnap
Successfully installed bootsnap-1.18.3
% sudo gem install addressable
Successfully installed addressable-2.8.6
% sudo gem install selenium-webdriver
Successfully installed selenium-webdriver-4.21.1
% sudo gem install net-imap
Successfully installed net-imap-0.4.11
% sudo gem install capybara
Successfully installed capybara-3.40.0
% sudo gem install irb
Successfully installed irb-1.13.1
% sudo gem install debug
Successfully installed debug-1.9.2
% sudo gem install sprockets-rails
Successfully installed sprockets-rails-3.4.2
% sudo gem install jbuilder
Successfully installed jbuilder-2.12.0
% sudo gem install importmap-rails
Successfully installed importmap-rails-2.0.1
% sudo gem install sqlite3 
Successfully installed sqlite3-2.0.1-x86_64-darwin
% sudo gem install stimulus-rails 
Successfully installed stimulus-rails-1.3.3
% sudo gem install turbo-rails 
Successfully installed turbo-rails-2.0.5
% sudo gem install web-console
Successfully installed web-console-4.2.1
% sudo gem install sqlite3
Successfully installed sqlite3-2.0.1-x86_64-darwin

Gemfileの修正
gem 'sqlite3', '~> 2.0'

Bundle complete! 14 Gemfile dependencies, 82 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
installは成功、、、

----------------------------------------

rails server

http://127.0.0.1:3000

Puma caught this error: Error loading the 'sqlite3' Active Record adapter. Missing a gem it depends on? can't activate sqlite3 (~> 1.4), already activated sqlite3-2.0.1-x86_64-darwin. Make sure all dependencies are added to Gemfile. (LoadError)

# give up
# sqlite3については、最新版でなく、旧versionを要求しているのか

----------------------------------------