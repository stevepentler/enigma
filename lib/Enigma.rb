require 'pry'
require './lib/Translator'

class Enigma

  def encrypt(key = nil, message)
    t = Translator.new(message, key)
    return t.produce_encrypted_message
  end 

  def decrypt(key = nil, date, encrypted_message)
    t = Translator.new(encrypted_message, key, date)
    return t.produce_decrypted_message
  end 

  def crack(date, output)
    skip
    t = 
    return 
  end 

end 


