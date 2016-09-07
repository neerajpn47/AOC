filename = ARGV[0].strip
all_characters, valid_characters  = 0, 0

file = File.read(filename)
file.each_line do |line|
  
  newline = line.strip
  all_characters += newline.length    
  next if newline.empty?  
 
  escape_seq = newline[1..-2].gsub(/(\\x..)|(\\")|(\\\\)/,'_') 
  valid_characters += escape_seq.length 
 
end

p all_characters - valid_characters
