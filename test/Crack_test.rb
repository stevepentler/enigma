require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Crack'
require 'pry'

class CrackTest < Minitest::Test

  def test_message_length
    c = Crack.new("Pentler")
    assert_equal 7, c.message_length
  end 

  def test_modulo_length
    c = Crack.new("Pentler")
    assert_equal 3, c.modulo_length
  end 

  def test_intercepted_indices
    c = Crack.new("Pentler")       #t = 84
    assert_equal [84, 76, 69, 82], c.intercepted_indices
  end

  def test_intercepted_indices_with_symbols #g = 71
    c = Crack.new("$gP15")       
    assert_equal [71, 48, 17, 21], c.intercepted_indices
  end 

  def test_differences
    c = Crack.new("Pentler")       #84-78 = 6, 76 - 68 = 8
    assert_equal [6, 8, 55, 68], c.find_difference
  end 

  def test_differences_with_symbols #5 => 21 - 14 = 7
    c = Crack.new("$gP15")       
    assert_equal [-7, -20, 3, 7], c.find_difference
  end 

  def test_normalized_differences_without_changes
    c = Crack.new("Pentler")       
    assert_equal [6, 8, 55, 68], c.normalize_offsets
  end 

  def test_normalized_differences_with_negatives #g = 71
    c = Crack.new("$gP15")
    assert_equal [84, 71, 3, 7], c.normalize_offsets
  end 

  def test_original_modified_key_values_before_rotate
    c = Crack.new("$gP15")
    assert_equal [84, 71, 3, 7],  c.normalize_offsets
  end 

  def test_rotations
    c = Crack.new("$gP15")
    assert_equal [7, 84, 71, 3],  c.rotated_differences
  end 

  def test_crack_key_on_original_message_equals_0
    c = Crack.new("nd..")
    assert_equal 0, c.crack_key
  end

end 


 