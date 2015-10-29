require 'pry'
require './lib/characters'
require './lib/Translator'


class Crack

attr_accessor :cracked
  
  def initialize(message, date = nil)
    @message = message
    @characters = Characters.new
    @cracked = []
  end 

  def intercepted_indices
    indices = []
    message = @message.to_s.chars
    message.each do |character|
      indices << @characters.character_map.index(character)
      end 
    return indices.last(4)
  end 

  def cracked_offsets
    known_pattern = [78, 68, 14, 14]
    intercepted_indices.each_with_index do |num, index|
      @cracked << ((num - known_pattern[index]) % 91)
    end 
  end 
  
  def rotate_offsets
    crack = cracked_offsets
    turns = (@message.length % 4)
    adjust = (turns * -1)
    crack.rotate!(adjust)
  end

  def crack_key
    cracked_key = rotate_offsets
    return cracked_key
  end 

end 


