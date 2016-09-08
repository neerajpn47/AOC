filename = ARGV[0].strip
total_character_length, valid_character_length = 0, 0

file = File.read(filename)
file.each_line do |line|
  valid_character_length += line.strip.length
  total_character_length += line.inspect.strip.length - 2
end

difference =  total_character_length - valid_character_length
puts difference
