require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Key_duplicate'
require 'pry' 

class KeyDuplicateTest < Minitest::Test

  def test_date_output
    set = Key.new("This message ..end..", 71215)
    assert_equal 4, set.date_offset.length
  end 

  def test_initial_key_length
    set = Key.new("This message ..end..", 71215)
    assert_equal 5, set.key.to_s.length
  end

  def test_date_offset_length
    set = Key.new("This message ..end..", 71215)
    assert_equal 4, set.date_offset.length
  end 

  def test_key_offset_length
    set = Key.new("This message ..end..", 71215)
    assert_equal 4, set.key_offset.length
  end 

  def test_final_offset_length
    set = Key.new("This message ..end..", 71215)
    assert_equal 4, set.rotors.length
  end 

  def test_final_key_length
    set = Key.new("This message ..end..", 71215)
    assert_equal 4, set.rotors.length
  end 
end 