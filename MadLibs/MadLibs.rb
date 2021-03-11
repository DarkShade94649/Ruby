
# Getting Input
print "\e[H\e[2J"
puts ">> Story <<"
puts "	[1] The Monkey King! (6)"
puts "	[2] My Trip To Disney World! (10)"
puts "	[3] A Day At The Zoo! (11)"
puts "	[4] At The Arcade (16)"
puts "	[5] The Fun Park! (18)"
puts "	[6] The First Day of School (26)"
print "Choose: "
choice = gets.chomp()

# Choose loop...
until (1..6).to_s.include?(choice)
	puts "Invalid choice #{choice}"
	print "Choose: "
	choice = gets.chomp()
end

# Choose file acccording to choice
opt = {
	"1" => File.open("The Monkey King!").read,
	"2" => File.open("My Trip To Disney World!").read,
	"3" => File.open("A Day At The Zoo!").read,
	"4" => File.open("At The Arcade").read,
	"5" => File.open("The Fun Park!").read,
	"6" => File.open("The First Day of School").read
}
print "\e[H\e[2J"

# Find the word inside angle brackets
map = opt[choice][/\<(.*?)\>/m, 1]

# Main loop
begin
	while map != nil and file.include? map
		print "#{map}: "
		file = file.sub("<#{map}>", gets.chomp())
		map = file[/\<(.*?)\>/m, 1]
	end

	# Print out the MadLib Story
	print "\e[H\e[2J"
	puts $file

# Handling (TypeError) Caused by Invalid Input in File
rescue TypeError => e
	# puts e
	puts "No Replacements Detected!"
	puts "Put the word type inside '<' and '>'"
	puts "Example: There was a big <noun>."

# Handing ^C Interrrupt
rescue Interrupt => e
	# puts e
	puts " Detected!"
	sleep(1)
end

puts "-----------------------------------------------------"
print "Hit Enter To Continue >> "
gets.chomp()
print "\e[H\e[2J"
