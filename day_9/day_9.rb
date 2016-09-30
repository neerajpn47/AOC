filename = ARGV[0].strip
locations = Hash.new { |h, k| h[k] = {} }
all_cities = []
total_distances = []

file = File.read(filename)
file.each_line do |line|
  from, to, distance = line.match(/(\w+) .. (\w+) . (\d+)/).captures
  locations[from][to] = distance.to_i
  locations[to][from] = distance.to_i
  all_cities = locations.keys
end

all_cities.permutation.to_a.each do |path|
  path_distance = 0
  7.times do |i|
    origin = path[i]
    destination = path[i + 1]
    path_distance += locations[origin][destination]
  end
  total_distances << path_distance
end
puts "part one answer: #{total_distances.min}"
puts "part two answer: #{total_distances.max}"
