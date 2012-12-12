module Morsu
  class Parser

    MORSE_CODE = {
      'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.', 'F' => '..-.',
      'G' => '--.', 'H' => '....', 'I' => '..', 'J' => '.---', 'K' => '-.-', 'L' => '.-..',
      'M' => '--', 'N' => '-.', 'O' => '---', 'P' => '.--.', 'Q' => '--.-', 'R' => '.-.',
      'S' => '...', 'T' => '-', 'U' => '..-', 'V' => '...-', 'W' => '.--', 'X' => '-..-',
      'Y' => '-.--', 'Z' => '--..', '1' => '.----', '2' => '..---', '3' => '...--',
      '4' => '....-', '5' => '.....', '6' => '-....', '7' => '--...', '8' => '---..',
      '9' => '----.', '0' => '-----'
    }

    PLAINTEXT = {
      '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F',
      '--.' => 'G', '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L',
      '--' => 'M', '-.' => 'N', '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R',
      '...' => 'S', '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X',
      '-.--' => 'Y', '--..' => 'Z', '.----' => '1', '..---' => '2', '...--' => '3',
      '....-' => '4', '.....' => '5', '-....' => '6', '--...' => '7', '---..' => '8',
      '----.' => '9', '-----' => '0'
    }

    def self.parse_plaintext(plaintext)
      encoded_text = ''
      words = plaintext.split(' ')
      words.each do |word|
        word.each_char.map do |letter|
         encoded_text << "#{MORSE_CODE[letter.upcase]} " if MORSE_CODE.has_key?(letter.upcase)
        end
        encoded_text << (' ' * 6)
      end
      encoded_text.strip
    end

    def self.parse_morse_code(encoded_text, opts = {})
      defaults = { :word_separator => '      ', :letter_separator => ' ' }
      opts = defaults.merge(opts)

      plaintext = ''
      words = encoded_text.split(opts[:word_separator])

      words.each do |word|
        word.split(opts[:letter_separator]).each do |key|
          plaintext << PLAINTEXT[key] if PLAINTEXT.has_key?(key)
        end
        plaintext << (' ')
      end
      plaintext.strip
    end
  end
end
