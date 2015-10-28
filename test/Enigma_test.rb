require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Engima'
require 'pry'

class TranslatorTest < Minitest::Test

  def test_encrypt_message
    e = Translator.new("$gP15", 71215)
    assert_equal "ku!", e.produce_encrypted_message
  end 
end 