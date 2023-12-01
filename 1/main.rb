lines = File.readlines("input.txt").map(&:chomp)

mappings = {
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
}

part1_digits = lines.map {|x| x.gsub(/[a-z]/, "").split("") }
part1_sum = part1_digits.map { |x| [x[0], x[-1]].join.to_i }.sum.to_s

regex = /(?=([1-9]|one|two|three|four|five|six|seven|eight|nine))/

part2_digits = lines.map do |x|
    matches = x.scan(regex).flatten

    [
        mappings[matches[0]] || matches[0].to_i,
        mappings[matches[-1]] || matches[-1].to_i
    ].join.to_i
end

puts "Part 1: " + part1_sum
puts "Part 2: " + part2_digits.sum.inspect.to_s
