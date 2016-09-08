filename = ARGV[0].strip
all_characters_count = 0
valid_characters_count = 0

file = File.read(filename)
file.each_line do |line| 
  newline = line.strip
  next if newline.empty?  
 
  all_characters_count += newline.length
  valid_strings = newline[1..-2] 
  escape_seq = valid_strings.gsub(/(\\x..)|(\\")|(\\\\)/,'_') 
  valid_characters_count += escape_seq.length 
end

difference =  all_characters_count - valid_characters_count
puts difference
