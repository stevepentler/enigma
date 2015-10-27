require 'pry'

class Key

attr_reader :key, :message

  def initialize(message, key = nil)
    @key = key
    @message = message   
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

  def key_offset
    key_holder = []
    key_offset = []
    @key = @key.to_s.chars
    @key.map do |integer|
      key_holder << integer
      end
    key_offset << key_holder[0..1].join
    key_offset << key_holder[1..2].join
    key_offset << key_holder[2..3].join
    key_offset << key_holder[3..4].join
    return key_offset 
  end 

  def date_offset
    @time = Time.now.to_a
    date_holder = []
    date_holder << day = @time[3]
    date_holder << month = @time[4]
    date_holder << year = @time[5].to_s[-2..-1].to_i
    @date = date_holder.join.to_i

    squared_date = @date ** 2
    date_offsets = squared_date.to_s[-4..-1]
    date_offsets = date_offsets.split(//)
    return date_offsets
  end 

  def rotors
    rotations = []
    rotations << key_offset[0].to_i + date_offset[0].to_i
    rotations << key_offset[1].to_i + date_offset[1].to_i
    rotations << key_offset[2].to_i + date_offset[2].to_i
    rotations << key_offset[3].to_i + date_offset[3].to_i
    return rotations
  end 
end 


