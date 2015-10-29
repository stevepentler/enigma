require 'pry'
require './lib/characters'
require './lib/Translator'

class Crack

  def initialize(message, date = nil)
    @message = message
    @characters = Characters.new
  end 

  def message_length
    @message.length
  end 

  def modulo_length
    @message.length % 4 
  end 

  def intercepted_indices
    indices = []
    message = @message.to_s.chars
    message.each do |character|
      indices << @characters.character_map.index(character)
      end 
    return indices.last(4)
  end 

  def find_difference
    end_pattern = [78, 68, 14, 14]
    differences = intercepted_indices.map.with_index do |num, index|
      num - end_pattern[index]
      end 
    return differences 
  end

 def normalize_offsets
    offsets = find_difference.map do |num|
      num % @characters.character_map_length
      end 
    return offsets
  end 
  
  def rotated_differences
    adjust = (modulo_length * -1)
    normalize_offsets.rotate!(adjust)
  end

  def crack_key
    cracked_key = rotated_differences.join.to_s.squeeze.to_i 
    return cracked_key
  end 

end 


