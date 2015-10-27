require '../lib/Encrypt'

class Enigma

  def encrypt(message, key = nil, date = nil)
    encrypt = Encrpyt.new(message, key, date)
  end 
end 


