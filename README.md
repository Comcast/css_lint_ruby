# csslint 

A rudimentary gem that wraps the command line Rhino version of Nicole Sullivan's [csslint](http://csslint.net).

Nothing too fancy and kinda rough around the edges...csslint was made during Comcast Interactive Media's March 2012 Labweek.

## Installation
  
    git clone https://github.com/comcast/csslint
    cd csslint
    bundle install
    rake
    gem build css_lint.gemspec

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
