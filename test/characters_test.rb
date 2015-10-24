require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Characters'
require 'pry'


class CharactersTest < Minitest::Test

  def test_refute_key_is_nil
    set = Characters.new
    refute set.characters == nil
  end

  def test_number_of_characters
    set = Characters.new
    assert_equal 39, set.characters.length
  end

  def test_set_only_valid_characters
    set = Characters.new
    assert set.characters.include?("k")
    assert set.characters.include?(",")
    refute set.characters.include?("K")
    refute set.characters.include?("12")
    refute set.characters.include?("  ")
  end
end
