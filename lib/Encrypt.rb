require 'pry'
require '../lib/characters'

class Encrypt 

  attr_accessor :message, :key, :date 

  #break string into characters

  def initialize(key, message)
    @key = key
    @message = message 
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
    @define_final_key 
  end 

  #add A to every 4th number in array (starting with 0) and if number >characters.length % characters.length
  #add B to every 4th number in array (starting with 1) and if number >characters.length % characters.length
  #add C to every 4th number in array (starting with 2) and if number >characters.length % characters.length
  #add D to every 4th number in array (starting with 3) and if number >characters.length % characters.length
  ##### need to account for when next number == nil 
  ##### is it better to do ABCD to first 4 numbers until nil, or will that cause a problem 
  ##### should there by an odd number of characters? 
  
  def adjust_index_number
  end 

  #reference character map and assign each number to character
  def reassign_to_character
  end 



end 