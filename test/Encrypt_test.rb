require 'minitest'          
require 'minitest/autorun' 
require 'minitest/pride'    
require '../lib/Encrypt'
require '../lib/characters'
require 'pry'


class EncryptTest < Minitest::Test

  def test_assign_character_to_number
  e = Encrypt.new(1234, "This is my message. ..end..")
  assert_equal 19, e.assign_index_number.first
  assert_equal 37, e.assign_index_number.last
  end 

  def test_encrypted_digit_length_is_accurate
  e = Encrypt.new(1234, "This is my message. ..end..")
  assert_equal 27, e.assign_index_number.length
  end 


  #array = key 
  #message.map do |num|
    #num + array[0] 
      #array.rotate   #rotates to next 
    #end





end 

