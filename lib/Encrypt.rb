require 'pry'
require '../lib/Characters'

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
    @collected_elements = []
    characters = Characters.new.characters
    binding.pry
    split.each do |char|
      if char == characters.each 
        @collected_elements << char.find_index
      end 

    end
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