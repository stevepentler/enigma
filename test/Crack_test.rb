require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Crack'
require 'pry'

class CrackTest < Minitest::Test


  def test_determination
    c = Crack.new("this poop")
    assert c.determination 
  end 

  def test_key_cracks
    skip
    c = Crack.new(intercepted_message)
    assert c.crack_key 
  end 
end 