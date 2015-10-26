require 'minitest'          
require 'minitest/autorun' 
require 'minitest/pride'    
require '../lib/Encrypt'
require 'pry'


class EncryptTest < Minitest::Test

  def test_message_split_includes_characters
  e = Encrypt.new(1234, "This is my message. ..end..")
  assert e.assign_index_number.include?("e") && (".")
  end 

  def test_index_number
  e = Encrypt.new(1234, "This is my message. ..end..")
  assert e.assign_index_number.last
  end 





end 

