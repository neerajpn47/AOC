filename = ARGV[0].strip
wires = {}
loop do 
  file = File.read(filename)
  file.each_line do |line|
    input = line.strip.split
    l = input.length
    if l == 3 and input[1] == '->'
      if input[0] =~ /\d+/ or wires[input[0]]
        wires[input[2]] = wires[input[0]] || input[0].to_i
      end  
    elsif l == 4 and input[0] == 'NOT'
      if wires[input[1]] or input[1] =~ /\d+/ 
        wires[input[3]] = (~wires[input[1]] || ~input[1].to_i) % 65536
      end
    elsif l == 5
      operator, result = input[1], input[4]

      next unless input[0] =~ /\d+/ or wires[input[0]]
      operand_1 = wires[input[0]] || input[0].to_i

      next unless input[2] =~ /\d+/ or wires[input[2]]
      operand_2 = wires[input[2]] || input[2].to_i
      if operator == 'AND'  
        wires[result] = operand_1 & operand_2
      elsif operator == 'OR'
        wires[result] = operand_1 | operand_2
      elsif operator == 'RSHIFT'
          wires[result] = operand_1 >> operand_2
      elsif operator == 'LSHIFT'
          wires[result] = operand_1 << operand_2
      end
    end
  end
  break if wires['a']
end
puts wires['a']
