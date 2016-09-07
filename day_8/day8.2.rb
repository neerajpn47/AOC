filename = ARGV[0].strip
total_strings, valid_strings = 0, 0 

file = File.read(filename)
file.each_line do |line|
  valid_strings += line.strip.length
  total_strings += line.inspect.strip.length - 2 
  
end

p total_strings - valid_strings
