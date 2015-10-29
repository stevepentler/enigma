require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Enigma'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_encrypt_message
    e = Enigma.new
    output = e.encrypt("$gP15", 71215)
    assert_equal "kugE!", output
  end 

  def test_encrypt_messagesfdsfd
    e = Enigma.new
    output = e.encrypt("This is my message ..end..", 71215)
    assert_equal "@v%,gw/4Y,7&Q&/uSs7Bus*xu<", output
  end

  def test_decrypt_message
    e = Enigma.new
    output = e.decrypt("kugE!", 71215, Date.today)
    assert_equal "$gP15", output
  end

  def test_crack_message
    e = Enigma.new
    output = e.crack("kugE!", Date.today)
    assert_equal 787323, output
  end 
  
end 