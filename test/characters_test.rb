require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Characters'
require 'pry'

class CharactersTest < Minitest::Test

  def test_refute_key_is_nil
    set = Characters.new
    refute set.character_map == nil
  end

  def test_character_map_length
    set = Characters.new
    assert_equal 91, set.character_map_length
  end

  def test_validate_characters
    set = Characters.new
    assert set.character_map.include?("k")
    assert set.character_map.include?(",")
    assert set.character_map.include?(" ")
    assert set.character_map.include?("K")
    refute set.character_map.include?("12")
    refute set.character_map.include?("  ")
  end
end
