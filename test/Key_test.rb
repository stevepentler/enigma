 require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Key'
require 'pry' 

class KeyTest < Minitest::Test

  def test_date_output
    set = Key.new
    assert_equal 4, set.define_date_offset.length
  end 

  def test_initial_key_length
    set = Key.new
    assert_equal 5, set.initial_key.length
  end

  def test_date_offset_length
    set = Key.new 
    assert_equal 4, set.define_date_offset.length
  end 

  def test_key_offset_length
    set = Key.new
    assert_equal 4, set.define_key_offset.length
  end 

  def test_final_offset_length
    set = Key.new
    assert_equal 4, set.define_final_key.length
  end 

  def test_final_key_length
    set = Key.new
    assert_equal 4, set.define_final_key.length
  end 

  def test_compare_rotations_with_final_key
    set = Key.new 
    assert_equal set.rotation_a, set.define_final_key[0]
    assert_equal set.rotation_b, set.define_final_key[1]
    assert_equal set.rotation_c, set.define_final_key[2]
    assert_equal set.rotation_d, set.define_final_key[3]
  end 

  def test_rotation_values
    set = Key.new
    refute set.rotation_a.abs > 38
    refute set.rotation_b.abs > 38
    refute set.rotation_c.abs > 38
    refute set.rotation_d.abs > 38
  end 

end 