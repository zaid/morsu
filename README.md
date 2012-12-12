# Morsu

A simple Morse code library.

## Installation

Add this line to your application's Gemfile:

    gem 'morsu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install morsu

## Usage

    require 'morsu'
    
    # Parse plaintext into Morse code
    Morsu::Parser.parse_plaintext('Hello World')

    # Parse Morse code into plaintext
    Morsu::Parser.parse_morse_code('... --- ...')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
