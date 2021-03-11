
# Getting Input
print "\e[H\e[2J"
puts ">> Measurement <<"
puts "	[1] Length"
puts "	[2] Mass"
puts "	[3] Capacity"
puts "	[4] Digital"
print "Choose: "
choice = gets.chomp()

# Choose loop...
until (1..5).to_s.include?(choice)
	puts "Invalid choice #{choice}"
	print "Choose: "
	choice = gets.chomp()
end

# Initiaizing acccording to choice
opt = {
	"1" = {"mm" => 0.001, "cm" => 0.01, "m" => 1, "km" => 1000}
	"2" = {"mg" => 0.001, "g" => 1, "kg" => 1000, "t" => 1}
	"3" = {"ml" => 0.001, "l" => 1, "kl" => 1000}
	"4" = {"B" => 1, "KB" => 1024, "MB" => 1024**2, "GB" => 1024**3, "TB" => 1024**4}
}

type = opt[choice]

# Intro
print "\e[H\e[2J"
puts "\e[32mTutorial\e[0m"
puts "\e[36mConvert What: 57cm\e[0m"
puts "\e[36mInto What: m\nAnswer: 0.57m\e[0m"
puts "\e[33m(mm for Millimetre, m for Metre, etc...\e[0m)"
puts "\e[35mEnter to continue...\e[0m"
gets

# Getting Input
print "\e[H\e[2J"
puts "Available: #{type}"
print "Convert What: "
inp = gets.chomp
unit_in = input.sub(input.to_f.to_s.sub(/\.?0+$/, ''), '')
val = input.to_f
print "Into What: "
unit_out = gets.chomp

# Convert and print out the result
puts "Answer: #{val * type[unit_in] / type[unit_out]}"
