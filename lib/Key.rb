require 'pry'
require 'date'

class Key

attr_reader :key, :message, :date

  def initialize( key = nil, date)
    @key = key
    @date = date
  end 

  def generate_key
    if @key == nil 
      5.times do |array| 
        @key << rand(10)
      end 
    else 
      @key = @key 
    end 
  end 

  def key_offset #71, 12, 21, 15
    key_holder = @key.to_s.chars
    key_offsets = []
    key_offsets << key_holder[0..1].join
    key_offsets << key_holder[1..2].join
    key_offsets << key_holder[2..3].join
    key_offsets << key_holder[3..4].join
    return key_offsets 
  end 



  def date_offset      #0225

    formatted_date = date.strftime("%d%m%y").to_i
    #@date = 271015
    squared_date = formatted_date ** 2
    date_offsets = squared_date.to_s[-4..-1]
    date_offsets = date_offsets.split("")
    return date_offsets
  end 

  def rotors     
    rotations = []
    rotations << (key_offset[0].to_i + date_offset[0].to_i)
    rotations << (key_offset[1].to_i + date_offset[1].to_i)
    rotations << (key_offset[2].to_i + date_offset[2].to_i)
    rotations << (key_offset[3].to_i + date_offset[3].to_i)
    return rotations
  end 
end 