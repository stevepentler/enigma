require 'pry'
require './lib/Translator'
require './lib/Crack'

class Enigma

  def encrypt(message, key = nil)
    t = Translator.new(message, key)
    return t.produce_encrypted_message
  end 

  def decrypt(message, key = nil, date = Date.today)
    t = Translator.new(message, key, date)
    return t.produce_decrypted_message
  end 

  def crack(message, date = Date.today)
    c = Crack.new(message, date)
    return c.crack_key
  end 

end 