require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Key'
require 'pry' 

class KeyDuplicateTest < Minitest::Test

  def test_date_output
    set = Key.new(71215)
    assert_equal 4, set.date_offset.length
  end 

  def test_initial_key_length
    set = Key.new(71215)
    assert_equal 5, set.key.to_s.length
  end

  def test_key_offsets_using_key_arugements
    set = Key.new(71215)
    assert_equal "71", set.key_offset.first
    assert_equal "12", set.key_offset[1]
    assert_equal "21", set.key_offset[2]
    assert_equal "15", set.key_offset[3]
  end 

  def test_key_offset_length
    set = Key.new( 71215)
    assert_equal 4, set.key_offset.length
  end 

  def test_date_offset_length
    set = Key.new(71215)
    assert_equal 4, set.date_offset.length
  end 

  def test_rotors_length
    set = Key.new( 71215)
    assert_equal 4, set.rotors.length
  end 
end 