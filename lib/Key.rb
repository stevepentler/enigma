require 'pry'

class Key

attr_reader :date, :initial_key, :final_key, :date_offset, :key_offset

  def initialize
    @time = Time.now.to_a
    @date = date
    @date_offset = date_offset
    @final_key = []
    @initial_key = []
    @key_offset = []
    
    5.times do |array|
        @initial_key << rand(10)
    end
      return @initial_key
  end

  def key_offset
    @initial_key.map do |integer|
      @key_offset << integer.to_s
    end
    
    key_holder = @key_offset
    @key_offset = []
    @key_offset << key_holder[0..1].join
    @key_offset << key_holder[1..2].join
    @key_offset << key_holder[2..3].join
    @key_offset << key_holder[3..4].join
    return @key_offset
    
    
  end 

  def date_offset
    date_holder = []
    date_holder << day = @time[3]
    date_holder << month = @time[4]
    date_holder << year = @time[5].to_s[-2..-1].to_i
    @date = date_holder.join.to_i

    squared_date = @date ** 2
    @date_offset = squared_date.to_s[-4..-1]
    return @date_offset
  end 

  def final_offset
    #ADD 1st element of key offset with 1st element of date offset
    #assign sum to A
    #repeat A -
  end 

end 

  #  def current_date
  #   date_holder = []
  #   date_holder << day = @time[3]
  #   date_holder << month = @time[4]
  #   date_holder << year = @time[5].to_s[-2..-1].to_i
  #   @date = date_holder.join.to_i
  # end 


