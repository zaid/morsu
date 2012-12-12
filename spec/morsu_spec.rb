require 'morsu'

describe Morsu::Parser do
  context "public interface" do
    it "responds to 'parse_plaintext'" do
      Morsu::Parser.should respond_to(:parse_plaintext)
    end

    it "responds to 'parse_morse_code'" do
      Morsu::Parser.should respond_to(:parse_morse_code)
    end
  end

  context "parsing plaintext into morse code" do

    MORSE_CODE_HASH = {
      'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.', 'F' => '..-.',
      'G' => '--.', 'H' => '....', 'I' => '..', 'J' => '.---', 'K' => '-.-', 'L' => '.-..',
      'M' => '--', 'N' => '-.', 'O' => '---', 'P' => '.--.', 'Q' => '--.-', 'R' => '.-.',
      'S' => '...', 'T' => '-', 'U' => '..-', 'V' => '...-', 'W' => '.--', 'X' => '-..-',
      'Y' => '-.--', 'Z' => '--..', '1' => '.----', '2' => '..---', '3' => '...--',
      '4' => '....-', '5' => '.....', '6' => '-....', '7' => '--...', '8' => '---..',
      '9' => '----.', '0' => '-----'
    }

    it "should parse the lowercase alphabet into morse code" do
      MORSE_CODE_HASH.keys.each do |key|
        encoded_text = Morsu::Parser.parse_plaintext(key.upcase)
        encoded_text.should eql(MORSE_CODE_HASH[key]), "'#{encoded_text}' is not equal to #{MORSE_CODE_HASH[key]}"
      end
    end

    it "should parse the upcase alphabet into morse code" do
      MORSE_CODE_HASH.keys.each do |key|
        encoded_text = Morsu::Parser.parse_plaintext(key.downcase)
        encoded_text.should eql(MORSE_CODE_HASH[key]), "'#{encoded_text}' is not equal to #{MORSE_CODE_HASH[key]}"
      end
    end

    it "should convert complete sentences" do
      encoded_text = Morsu::Parser.parse_plaintext('Hello World')
      encoded_text.should eql('.... . .-.. .-.. ---       .-- --- .-. .-.. -..')
    end

    it "should separate each letter by 1 space" do
      encoded_text = Morsu::Parser.parse_plaintext('Morse')
      encoded_text.split(' ').length.should eql(5)
    end

    it "should separate words by 7 spaces" do
      encoded_text = Morsu::Parser.parse_plaintext('Hello World')
      encoded_text.should include('      ')
    end
  end

  context "parsing morse code into plaintext" do

    PLAINTEXT_HASH = {
      '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F',
      '--.' => 'G', '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L',
      '--' => 'M', '-.' => 'N', '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R',
      '...' => 'S', '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X',
      '-.--' => 'Y', '--..' => 'Z', '.----' => '1', '..---' => '2', '...--' => '3',
      '....-' => '4', '.....' => '5', '-....' => '6', '--...' => '7', '---..' => '8',
      '----.' => '9', '-----' => '0'
    }

    it "should parse morse code into upcased alphabet" do
      PLAINTEXT_HASH.keys.each do |key|
        plaintext = Morsu::Parser.parse_morse_code(key)
        plaintext.should eql(PLAINTEXT_HASH[key]), "'#{plaintext}' is not equal to #{PLAINTEXT_HASH[key]}"
      end
    end

    it "should convert complete sentences" do
      plaintext = Morsu::Parser.parse_morse_code('.... . .-.. .-.. ---       .-- --- .-. .-.. -..')
      plaintext.should eql('HELLO WORLD')
    end

    it "should parse words which are 4 spaces apart" do
      plaintext = Morsu::Parser.parse_morse_code('..-. -. ---     .-. -..', :word_separator => (' ' * 4))
      plaintext.should eql('FNO RD')
    end

    it "should parse letters which are 2 spaces apart" do
      plaintext = Morsu::Parser.parse_morse_code('..-.  -.  ---        .-.  -..', :letter_separator => '  ')
      plaintext.should eql('FNO RD')
    end
  end

end
