require 'minitest'          
require 'minitest/autorun' 
require 'minitest/pride'    
require '../lib/Decrypt'
require '../lib/characters'
require 'pry'


class DecryptTest < Minitest::Test

  def test_assign_character_to_number
  e = Decrypt.new(71215, "This is my message. ..end..")
  assert_equal 19, e.assign_index_number.first
  assert_equal 37, e.assign_index_number.last
  assert_equal 36, e.assign_index_number[4]
  end 

  def test_encrypted_digit_length_accurate
  e = Decrypt.new(71215, "This is my message. ..end..")
  assert_equal 27, e.assign_index_number.length
  end 

  def test_rotate_encrypted_digits
    e = Decrypt.new(71215, "This ..end..")
    assert_equal 51, e.rotate_encrypted_digits.first
    assert_equal 57, e.rotate_encrypted_digits.last
  end 

  def test_normalized_message_accurate
    e = Decrypt.new(71215, "This ..end..")
    assert_equal 12, e.normalize_encrypted_message.first
    assert_equal 18, e.normalize_encrypted_message.last
  end 

  def test_encrypted_message_accurate
    e = Decrypt.new(71215, "This ..end..")
    assert_equal "m", e.encrypt_message[0]
    assert_equal "v", e.encrypt_message[1]
    assert_equal "s", e.encrypt_message[-1]
  end 

end 
