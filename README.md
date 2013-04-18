# css_lint_ruby

[![Build Status](https://secure.travis-ci.org/Comcast/css_lint_ruby.png)](http://travis-ci.org/Comcast/css_lint_ruby) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Comcast/css_lint_ruby)

A rudimentary gem that wraps the command line Rhino version of Nicholas C. Zakas and Nicole Sullivan's [csslint](http://csslint.net).

Nothing too fancy and kinda rough around the edges...css_lint was made during Comcast Interactive Media's May 2012 Labweek as a dependency for using [CSS Lint for Sass & Compass](http://comcast.github.io/compass-csslint/).

## Installation
  
    git clone https://github.com/comcast/csslint
    cd csslint
    bundle install
    bundle exec rake
    gem build css_lint.gemspec
    gem install css_lint-0.9.10.0.gem

## Usage

Basic command line usage:
  
    css_lint <some_css_directory>

Or:

    css_lint <some_file.css>

## Tests

Run Rspec tests:

    rake

Browse code coverage via [simplecov](https://github.com/colszowka/simplecov):

    open coverage/index.html
