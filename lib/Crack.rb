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

 def normalize_differences
    modified = find_difference.map do |num|
      num % @characters.character_map_length
    end 
    return modified
  end 
  
  def rotated_differences
    rotate = (modulo_length * -1)
    normalize_differences.rotate!(rotate)
  end 

  # def cracked_key
  #   rotated_differences.to_s
  #   crack_key = []
  #   crack_key << rotated_differences[0..1].join
  #   crack_key << rotated_differences[1..2].join
  #   crack_key << rotated_differences[2..3].join
  #   crack_key << rotated_differences[3..4].join
  #   return crack_key
  # end 

end 



#negative rotate 
#join 


  # def index_intercepted_message
  #   t = Translator.new(@message)
  #   indexed_message = t.assign_index_number
  #   indexed_message
  #   binding.pry
  # end 

  # def determination
  #   index = index_intercepted_message.last(4)
  #   pattern = [78, 68, 14, 14]
  #   index.map do |index|
  #     index - pattern
  #     binding.pry
  #   end 
  # end 




 
  # def intialize(intercepted_message)
  #   @intercepted_message = intercepted_message.chars
  # end 

  # def rotate_key

  #   if intercepted_message.length % 4 == 0
  #     intercepted_message[-4..-1].assign_index_number
  #     intercepted_message.each do |index| 



  #   if intercepted_message.length % 4 == 1
  #     intercepted_message[-5..-2].assign_index_number
  #     1.times do rotor.rotate!

  #   if intercepted_message.length % 4 == 2
  #     intercepted_message[-6..-3].assign_index_number
  #     2.times do rotor.rotate!

  #   if intercepted_message.length % 4 == 3
  #     intercepted_message[-7..-4].assign_index_number
  #     3.times do rotor.rotate!




#   def rotate_encrypt
#     shifted = []
#     rotor = @key.rotors
#     assign_index_number.each do |index|
#       shifted << index + rotor[0]
#       rotor.rotate!





#   def crack_key 

#   end 




# end 
