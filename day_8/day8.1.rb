filename = ARGV[0].strip
all_characters, valid_characters  = 0, 0

file = File.read(filename)
file.each_line do |line|
  
  newline = line.strip
  all_characters += newline.length    
  next if newline.empty?  
 
  next_line =  newline[1..-2]
  escape_seq_1 = next_line.gsub(/(\\x..)|(\\\\)/,'_') 
  escape_seq_2 = escape_seq_1.gsub(/(\\")/,'_')
  valid_characters += escape_seq_2.length 
 
end

p all_characters - valid_characters
