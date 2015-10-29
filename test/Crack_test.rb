require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Crack'
require 'pry'

class CrackTest < Minitest::Test

  def test_intercepted_indices
    c = Crack.new("Pentler")       #t = 84
    assert_equal [84, 76, 69, 82], c.intercepted_indices
  end

  def test_intercepted_indices_with_symbols #g = 71
    c = Crack.new("$gP15")       
    assert_equal [71, 48, 17, 21], c.intercepted_indices
  end 

  def test_normalized_differences_without_changes
    c = Crack.new("$gP15")       
    assert_equal [71, 48, 17, 21], c.cracked_offsets
  end 

  def test_rotate_offsets_by_modulo
    c = Crack.new("end..")
    assert_equal [14, 78, 68, 14], c.rotate_offsets
  end 

  def test_crack_key_on_original_message_equals_0
    c = Crack.new("Steven Pentler")
    assert_equal [69, 82, 84, 76], c.crack_key
  end

end 


 