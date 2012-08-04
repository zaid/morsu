require 'morsu'

describe Morsu::Parser do
  context "public interface" do
    it "responds to 'parse_plaintext'" do
      Morsu::Parser.should respond_to(:parse_plaintext)
    end

    it "responds to 'parse_encoded_text'" do
      Morsu::Parser.should respond_to(:parse_encoded_text)
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

end
