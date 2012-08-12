require 'thor'
require 'morsu'

module Morsu
  class CLI < Thor

    desc "from_plaintext TEXT", "Convert plaintext into Morse code"
    def from_plaintext(text)
      puts Morsu::Parser.parse_plaintext(text)
    end
  end
end
