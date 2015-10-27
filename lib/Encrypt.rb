require 'pry'
require '../lib/characters'
require '../lib/Key'

class Encrypt 

  attr_accessor :message, :key

  def initialize(key, message)
    @key = key
    @message = message 
  end 

  def assign_index_number
    split = @message.downcase.chars 
      character_map = Characters.new
      reference = character_map.characters
      encrypted_digits = []

     split.each do |letter|
        encrypted_digits << reference.index(letter)
      end
    return encrypted_digits
  end 

  def shift
    set = Key.new
    shifted = []
    final_key = set.define_final_key
    assign_index_number.each do |num|
      shifted << num + final_key[0]
      final_key.rotate! 
    end 
    return shifted
  end 

  #shifted [51, 21, 31, 38, 68, 51, 60, 24, 45, 17, 60, 57]
  

  def normalize
    normalized_digits = []
    shift.each do |digit|
      if digit.abs >38
        normalized_digits << digit % 39 
      else
        normalized_digits << digit 
      end 
    end
    return normalized_digits
  end 

  #normalized_digits = [12, 21, 31, 38, 29, 12, 21, 24, 6, 17, 21, 18]

  def assign_value
    character_map = Characters.new
    reference = character_map.characters
    value = []
    normalize.each do |digit|
      value << reference.fetch(digit)
    end 
    return value.join
  end

  #value = ["m", "v", "5", ",", "3", "m", "v", "y", "g", "r", "v", "s"]

end 