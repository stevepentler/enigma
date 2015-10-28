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
    message = @message.chars
    message.each do |character|
      indices << @characters.character_map.index(character)
    end 
    return indices 
  end 

  def rotate_encrypt
    shifted = []
    rotor = @key.rotors
    assign_index_number.each do |index|
      shifted << index + rotor[0]
      rotor.rotate!
    end 
    return shifted
  end 

  def rotate_decrypt
    shifted = []
    rotor = @key.rotors
    assign_index_number.each do |index|
      shifted << index - rotor[0]
      rotor.rotate! 
    end 
    return shifted
  end 

  def normalize_encrypted_message
    normalized_rotors = []
    rotate_encrypt.each do |index|
      if index > @characters.character_map_length
        normalized_rotors << index % @characters.character_map_length 
      else
        normalized_rotors << index
      end 
    end
    return normalized_rotors
  end 

  def normalize_decrypted_message
    normalized_rotors = []
    rotate_decrypt.each do |index|
      if index < 0
        normalized_rotors << index % @characters.character_map_length 
      else
        normalized_rotors << index
      end 
    end
    return normalized_rotors
  end 

  def produce_encrypted_message
    altered_message = []
    normalize_encrypted_message.each do |index|
      altered_message << @characters.character_map.fetch(index)
    end 
    return altered_message.join
  end 

  def produce_decrypted_message
    altered_message = []
    normalize_decrypted_message.each do |index|
      altered_message << @characters.character_map.fetch(index)
    end 
    return altered_message.join
  end 

end


