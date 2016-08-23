filename = ARGV[0].strip

bulbs = []

1000.times do
  row = []
  1000.times do
    row << 'off'
  end
  bulbs << row
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
      elsif command == 'toggle'
        bulbs[i][j] = (bulbs[i][j] == 'off') ? 'on' : 'off'
      end
    end
  end
end

 
count = 0
0.upto(999) do |i| 
  0.upto(999) do |j|
    if bulbs[i][j] == 'on'
      count += 1
    end
  end
end
p count
