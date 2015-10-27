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
    e = Encrypt.new(71215, "This ..end..")
    assert_equal 51, e.shift.first
    assert_equal 57, e.shift.last
  end 

  def test_normalized_message_accurate
    e = Encrypt.new(71215, "This ..end..")
    assert_equal 12, e.normalize.first
    assert_equal 18, e.normalize.last
  end 

  def test_encrypted_message_accurate
    e = Encrypt.new(71215, "This ..end..")
    assert_equal "m", e.assign_value[0]
    assert_equal "v", e.assign_value[1]
    assert_equal "s", e.assign_value[-1]
  end 





end 

