require 'pry'
require './lib/characters'
require './lib/Key'

class Translator

  def initialize(message, key = nil, date = Date.today)
    @key = Key.new(key, date)
    @characters = Characters.new
    @message = message
    @rotors = @key.rotors
  end

  def assign_index_number
    indices = []
    message = @message
    message = @message.to_s.chars
    message.each do |character|
      indices << @characters.character_map.index(character)
      end 
    return indices 
  end 

  def rotate_encrypt
    shifted = []
    rotor = @key.rotors
    assign_index_number.each do |index|
      shifted << ((index + rotor[0]) % @characters.character_map_length) 
      rotor.rotate!
      end 
    return shifted
  end 

  def rotate_decrypt
    shifted = []
    rotor = @key.rotors
    assign_index_number.each do |index|
      shifted << ((index - rotor[0]) % @characters.character_map_length) 
      rotor.rotate! 
      end 
    return shifted
  end 

  def produce_encrypted_message
    altered_message = []
    rotate_encrypt.each do |index|
      altered_message << @characters.character_map.fetch(index)
      end 
    return altered_message.join
  end 

  def produce_decrypted_message
    altered_message = []
    rotate_decrypt.each do |index|
      altered_message << @characters.character_map.fetch(index)
      end 
    return altered_message.join
  end 

end


