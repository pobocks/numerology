#!/usr/bin/env ruby

# Calculates name numbers for numerological purposes, as per http://www.wikihow.com/Calculate-Your-Name-Number-in-Numerology
# For entertainment use only - OR IS IT?!?!!?

# Yes, it is

# Inputs: Names. Any valid command line arguments will be concatenated
# Output: Numbers, with helpful? explanatory text taken from Wikihow

# default to author
input = !ARGV.empty? ? ARGV.join(" ") :  "William David Mayo"
puts "#{input}\n\n"
input = input.downcase.gsub(/[^a-zA-Z]/, '')


# Create map of numerological equivalences for letters
$chart = {}
('a'..'z').each_with_index do |l, i|
  $chart[l] = ((i % 9) + 1)
end

# Create map of their meanings for display
meanings = {
  1 => "Initiating action, pioneering, leading, independent, attaining, individual.",
  2 => "Cooperation, adaptability, consideration of others, partnering, mediating.",
  3 => "Expression, verbalization, socialization, the arts, the joy of living.",
  4 => "A foundation, order, service, struggle against limits, steady growth.",
  5 => "Expansiveness, visionary, adventure, the constructive use of freedom.",
  6 => "Responsibility, protection, nurturing, community, balance, sympathy.",
  7 => "Analysis, understanding, knowledge, awareness, studious, meditating.",
  8 => "Practical endeavors, status oriented, power-seeking, high-material goals.",
  9 => "Humanitarian, giving nature, selflessness, obligations, creative expression.",
  11 => "Higher spiritual plane, intuitive, illumination, idealist, a dreamer.",
  22 => "The Master Builder, large endeavors, powerful force, leadership."
}


# Gets significant number from names
# Overall process -
#   1. get number by reducing via add
#   2. if number is not in {1-9,11,22}, add digits together
def significate char_array
  num = char_array.reduce(0) {|sum, el| sum + $chart[el]}
  while (num.to_s.length > 1)
    unless num.to_s[0] === num.to_s[1] and num <= 22
      num = num.to_s.split("").reduce(0) {|sum, el| sum + el.to_i}
    else
      break
    end
  end
  num
end


# Inner - Your true or inner nature
inner = significate input.scan(/[aeiou]/)

# Outer - How you present to the world
outer = significate input.scan(/[^aeiou]/)

# Overall - Your destiny or whatever. Why not?
overall = significate input.scan(/\w/)


puts "Inner Number: #{inner}"
puts "#{meanings[inner]}\n\n"

puts "Outer: #{outer}"
puts "#{meanings[outer]}\n\n"

puts "Overall: #{overall}"
puts "#{meanings[overall]}"
