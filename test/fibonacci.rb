require 'prime'

sequence = [0, 1]
n = 0 
while sequence.length < 100 
    result = sequence[n] + sequence[n + 1]
    if result.prime? 
      puts "#{result} is prime" 
    else
      puts "#{result} is not prime" 
    end 
    sequence << result 
    n += 1
  end 
