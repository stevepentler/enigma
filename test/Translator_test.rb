require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Translator'
require 'pry'

class TranslatorTest < Minitest::Test

  def test_assign_index
    e = Translator.new("$gP15", 71215)
    assert_equal 4, e.assign_index_number[0]
    assert_equal 71, e.assign_index_number[1]
    assert_equal 48, e.assign_index_number[2]
    assert_equal 17, e.assign_index_number[3]
    assert_equal 21, e.assign_index_number[4]
  end 

  def test_refute_nil_index_numbers
    e = Translator.new("$gP15", 71215)
    assert_equal false, e.assign_index_number == nil
  end 

  def test_encrypted_digit_length_equals_message_length
  e = Translator.new("$gP15", 71215)
  assert_equal 5, e.assign_index_number.length
  end 

  def test_rotate_encrypted_digits
    e = Translator.new("$gP15", 71215)
    assert_equal 75, e.rotate_encrypt[0] #($ = 4) + 71 (0date_offset) = 75
    assert_equal 85, e.rotate_encrypt[1] #(g = 71) + 14 (2date_offset)
    assert_equal 71, e.rotate_encrypt[2]
    assert_equal 37, e.rotate_encrypt[3]
    assert_equal 1, e.rotate_encrypt[4] #(5 = 21) + 71 (0date_offset) = 92
  end 

  def test_rotate_decrypted_digits
    e = Translator.new("$gP15", 71215) 
    assert_equal 24, e.rotate_decrypt[0] #($ = 4) - 71 (0date_offset) = -67
    assert_equal 57, e.rotate_decrypt[1] #(g = 71) - 14 (2date_offset)
    assert_equal 41, e.rotate_decrypt[4] #(5 = 21) - 71 (0date_offset) = -50
  end 

  def test_normalize_encrypted_message_indices_within_library_count
    e = Translator.new(" !", 71215) 
    assert_equal 71, e.rotate_encrypt[0] #() + 71 (0dateoffset) = 71
    assert_equal 15, e.rotate_encrypt[1] #(!) + 14 = 14
  end 

  def test_normalize_encrypted_message_indices_above_library_count
    e = Translator.new("zy", 71215) 
    assert_equal 70, e.rotate_encrypt[0] #(z = 90) + 71 (0dateoffset) = 
    assert_equal 12, e.rotate_encrypt[1] #(x = 89) + 14 % 91 = 12
  end 

  def test_normalize_decrypted_message_indices_within_library_count
    e = Translator.new("zy", 71215) 
    assert_equal 19, e.rotate_decrypt[0] #90 - 71 = 19
    assert_equal 75, e.rotate_decrypt[1] #89 - 14 = 75
  end

  def test_normalize_decrypted_message_indices_below_library_count
    e = Translator.new(" !", 71215) 
    assert_equal 20, e.rotate_decrypt[0] #( = 0) - 71 % 91 = 20
    assert_equal 78, e.rotate_decrypt[1] #(! = 1) - 14 % 91 = 78
  end   

  def test_produce_encrypted_message
    e = Translator.new("$gP15", 71215)
    assert_equal "k", e.produce_encrypted_message[0] #75=>k
    assert_equal "u", e.produce_encrypted_message[1] #85=>u
    assert_equal "!", e.produce_encrypted_message[4] #1 => !
  end  

  def test_produce_another_encrypted_message
    e = Translator.new("This is so secret!! ..end..", 12345)
    assert_equal "`", e.produce_encrypted_message[0] #75=>k
    assert_equal "&", e.produce_encrypted_message[1] #85=>u
    assert_equal "R", e.produce_encrypted_message[26]
    assert_equal "`&2J,'<R$-DJq!;<%:ER:G.EpGR", e.produce_encrypted_message #1 => !
  #`&2J,'<R$-DJq!;<%:ER:G.EpGR
  end  

  def test_produce_decrypted_message
    e = Translator.new("$gP15", 71215)
    assert_equal "8", e.produce_decrypted_message[0]  # -67 % 91 = 24 => 8
    assert_equal "Y", e.produce_decrypted_message[1]  
    assert_equal "I", e.produce_decrypted_message[4]  #-50 % 91 = 41 => I
  end

  def test_produce_another_decrypted_message
    e = Translator.new("`&2J,'<R$-DJq!;<%:ER:G.EpGR", 12345)
    assert_equal "T", e.produce_decrypted_message[0]
    assert_equal "h", e.produce_decrypted_message[1]  
    assert_equal ".", e.produce_decrypted_message[26]
    assert_equal "This is so secret!! ..end..", e.produce_decrypted_message
  end  
end 