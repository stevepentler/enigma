require 'minitest'          
require 'minitest/autorun' 
require 'minitest/pride'    
require '../lib/Encrypt'
require '../lib/characters'
require 'pry'


class EncryptTest < Minitest::Test

  def test_assign_character_to_number
  e = Encrypt.new(71215, "This is my message. ..end..")
  assert_equal 19, e.assign_index_number.first
  assert_equal 37, e.assign_index_number.last
  assert_equal 36, e.assign_index_number[4]
  end 

  def test_encrypted_digit_length_accurate
  e = Encrypt.new(71215, "This is my message. ..end..")
  assert_equal 27, e.assign_index_number.length
  end 

  def test_rotate_encrypted_digits
    e = Encrypt.new(71215, "This iS iT")
    assert_equal 51, e.rotate_encrypted_digits.first
    assert_equal 33, e.rotate_encrypted_digits.last
  end 

  def test_encrypted_message_accurate
    e = Encrypt.new(71215, "This is my message. ..end..")
    assert_equal 12, e.normalize_encrypted_message.first
    assert_equal 21, e.normalize_encrypted_message.last

  end 






end 

