 require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Key'
require 'pry' 

class KeyTest < Minitest::Test

  def test_define_date
    skip
    date = Key.new
    assert_equal 6, date.current_date.to_s.length
  end 

  def test_initial_key_length
    set = Key.new
    assert_equal 5, set.initial_key.length
  end

  def test_date_offset_length
    set = Key.new 
    assert_equal 4, set.date_offset.length
  end 

  def test_final_offset_length
    set = Key.new
    assert set.final_offset
  end 

  def test_key_offset_length
    set = Key.new
    assert_equal 4, set.key_offset.length
  end 
end 