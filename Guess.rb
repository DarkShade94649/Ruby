
# Getting Input
print "\e[H\e[2J"
puts ">> Level <<"
puts "	[1] Easy (Under 100)"
puts "	[2] Medium (Under 1000)"
puts "	[3] Hard (Under 10000)"
print "Choose: "
choice = gets.chomp().to_s

# Choose loop...
until (1..3).to_s.include?(choice)
	puts "Invalid choice #{choice}"
	print "Choose: "
	choice = gets.chomp()
end

# Choose level acccording to choice
opt = {
	"1" = number => rand(100).to_i,
	"2" = number => rand(1000).to_i,
	"3" = number => rand(10000).to_i
}

# Set default values
guess = ""
chances = 9

# Getting Input
print "\e[H\e[2J"
print "(10 Chances) Guess the number: "
guess = gets.chomp().to_i

# Main loop
while guess != number and chances != 0

	# Give Clues
	if guess > number
		print "(#{chances}) High: "
		guess = gets.chomp().to_i
	else
		print "(#{chances}) Low: "
		guess = gets.chomp().to_i
	end

	# Decrease chances
	chances -= 1
end

# Won or Lose?
if guess == $number
	puts "You guessed the number: #{number}"
else
	puts "You are out of guesses!"
	puts "The number was #{number}"
end

sleep(3)
print "\e[H\e[2J"
