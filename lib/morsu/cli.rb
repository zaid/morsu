require 'thor'
require 'morsu'

module Morsu
  class CLI < Thor

    desc "from_plaintext TEXT", "Convert plaintext into Morse code"
    def from_plaintext(text)
      puts Morsu::Parser.parse_plaintext(text)
    end

    desc "from_morse_code MORSE CODE", "Convert Morse code into plaintext"
    def from_morse_code(text)
      puts Morsu::Parser.parse_morse_code(text)
    end
  end
end
