require 'pry'
require '../lib/characters'
require '../lib/Key'

class Encrypt 

  attr_accessor :message, :key, :date, :rotated_encrypted_digits

  #break string into characters

  def initialize(key, message)
    @key = key
    @message = message 
    @rotated_encrypted_digits = rotated_encrypted_digits
  end 

  #put message into downcase numbers
  #break string into array of characters
  #iterate over array of characters - match to characters in Character Map
  #if character matches character from Character Map, assign index number of Character Map 

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

  def rotate_encrypted_digits
    set = Key.new
    rotated_encrypted_digits = []
    final_key = set.define_final_key
    assign_index_number.each do |num|
      rotated_encrypted_digits << num + final_key[0]
      final_key.rotate! 
    end 
    return rotated_encrypted_digits
  end 
  
  # [51,21,31,38,68,22,41,56,44,38,59,32,36,32,41,20,38,
 #18,60,56,69,51,27,33,35,51,60]

  def normalize_encrypted_message
    normalized_digits = []

    rotate_encrypted_digits.each do |digit|
      if digit.abs >38
        normalized_digits << digit % 39 
      else
        normalized_digits << digit 
      end 
    end 
    return normalized_digits
  end 

  def encrypted_message

  end 


  #     encrypted_message << reference.value(digit)
       
  #       encrypted_message 
  #   end 
  #   binding.pry
  #   return encrypted_message
  # end 


  #reference character map and assign each number to character
  def reassign_to_character
  end 



end 