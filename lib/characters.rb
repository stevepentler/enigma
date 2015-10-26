require 'pry'

class Characters

  attr_reader :characters
  
  def characters
    @characters = 
               ["a", "b", "c", "d", "e", "f", "g", "h", "i", #0-8

                "j", "k", "l", "m", "n", "o", "p", "q", "r", #9-17

                "s", "t", "u", "v", "w", "x", "y", "z", "0", #18-26

                "1", "2", "3", "4", "5", "6", "7", "8", "9", #27-35

                " ", ".", ","]                                #36-39    
   return @characters                      
  end
end
