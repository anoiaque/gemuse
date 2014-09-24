# Gemuse

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'gemuse'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gemuse

## Usage

just a help, run your test suite after
what it does and how it does it:
....
Does not handle gem used for executable gems
not 100% accurate, ex you can use gem for css,html ie Sass ... so you can have false positives

to run rake task include  require 'gemuse/gem_tasks' in your Rakefile
then rake gemuse:unused

## Contributing

1. Fork it ( http://github.com/<my-github-username>/gemuse/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
