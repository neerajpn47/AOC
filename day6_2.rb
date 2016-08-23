filename = ARGV[0].strip

bulbs = []
brightness_level = []

1000.times do
  row1, row2 = [], []
  1000.times do
    row1 << 'off'
    row2 << 0
  end
  bulbs << row1
  brightness_level << row2
end

file = File.read(filename)
file.each_line do |line|

  words = line.split(" ")
  command = words.first

  index = (command == 'turn') ? 2 : 1
  from = words[index].split(',').map {|n| n.to_i}
  to = words[index+2].split(',').map {|n| n.to_i}

  from[0].upto(to[0]) do |i|
    from[1].upto(to[1]) do |j|
      if command == 'turn'
        bulbs[i][j] = (words[1] == 'on') ? 'on' : 'off'
        brightness_level[i][j] += (bulbs[i][j] == 'on') ? 1 : -1
	brightness_level[i][j] = 0 if (brightness_level[i][j] < 0)
      elsif command == 'toggle'
        brightness_level[i][j] += 2 
      end
    end
  end
end

count = 0
1000.times do |i|
  1000.times do |j|
    count += brightness_level[i][j]
  end
end

p count

