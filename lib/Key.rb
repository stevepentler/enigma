require 'pry'

class Key

attr_reader :date, :initial_key, :final_key, :date_offset, :key_offset, :summed_offsets

  def initialize
    @time = Time.now.to_a
    @date = date
    @date_offset = date_offset
    @key_offset = key_offset
    @final_key = final_key
    @summed_offsets = summed_offsets
    @initial_key = [7, 1, 2, 1, 5]
    

    
    # 5.times do |array|           #if generating random key
    #     @initial_key << rand(10)
    # end
    #   return @initial_key
  end

  def define_key_offset
    
    key_holder = []
    @key_offset = []
    @initial_key.map do |integer|
      key_holder << integer.to_s
    end
    @key_offset << key_holder[0..1].join
    @key_offset << key_holder[1..2].join
    @key_offset << key_holder[2..3].join
    @key_offset << key_holder[3..4].join
    @key_offset = @key_offset
    return @key_offset 
  end 

  def define_date_offset
    date_holder = []
    date_holder << day = @time[3]
    date_holder << month = @time[4]
    date_holder << year = @time[5].to_s[-2..-1].to_i
    @date = date_holder.join.to_i

    squared_date = @date ** 2
    @date_offset = squared_date.to_s[-4..-1]
    @date_offset = @date_offset.split(//)
    return @date_offset
  end 

  def define_summed_offset
    @summed_offsets = []
    @summed_offsets << define_key_offset[0].to_i + define_date_offset[0].to_i
    @summed_offsets << define_key_offset[1].to_i + define_date_offset[1].to_i
    @summed_offsets << define_key_offset[2].to_i + define_date_offset[2].to_i
    @summed_offsets << define_key_offset[3].to_i + define_date_offset[3].to_i
    return @summed_offsets
  end 

  def define_final_key        #would prefer characters.length 
    @final_key = []
    define_summed_offset.map do |rotation|
      if  rotation.abs > 38
        @final_key << rotation % 39 
      elsif rotation.abs <= 38
        @final_key << rotation
      end 
    end 
    return @final_key 
  end 

  def rotation_a
    @rotation_a = define_final_key[0]
  end 

  def rotation_b
    @rotation_b = define_final_key[1]
  end 

  def rotation_c
    @rotation_c = define_final_key[2]
  end 

  def rotation_d
    @rotation_d = define_final_key[3]
  end 

end 






