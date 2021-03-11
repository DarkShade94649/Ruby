
# Intro
print "\e[H\e[2J"
puts "\e[32mOperators: +, -, *, /, ^\e[0m"
puts "\e[33mEg: 6^2 #=> 36, 20-10*10 #=> 100, 10/2 #=> 5, etc...\e[0m"
puts "\e[32mFunctions: sin, cos, tan, sqrt\e[0m"
puts "\e[33mEg: sin(30) #=> 0.5, sqrt(36) #=> 6, etc...\e[0m"
puts "\e[37m\nREADME >>\e[0m"
puts "\e[36mThe default operator is addition(+).\e[0m"
puts "\e[36mYou can use operators at first to overrride default operator.\e[0m"
puts "\e[36mEg-(While result is 10): +5 #=> 15, *2 #=> 20, etc...\e[0m"
puts "\e[36mYou can also use parameters like:(5+5)*10 #=> 100.\e[0m"
puts "\e[36mThe whole program is case-insensitive.\e[0m"
puts "\e[36mSo SIN(30), sIn(30) and sin(30) are all the same.\e[0m"
puts "\e[35mEnter to continue...\e[0m"
gets

# Set default values
op = {
	"^" => "**",			# Power
	"sin" => "Math.sin",	# sin
	"cos" => "Math.cos",	# cos
	"tan" => "Math.tan",	# tan
	"sqrt" => "Math.sqrt",	# SquareRoot
	"08" => "8",			# Octal Digits
	"09" => "9"				# Octal Digits
}
more = "0"
rslt = "0"

begin

	# Main loop...
	while !more.empty?
		rslt = rslt.nil? ? "0" : rslt
		print "\e[H\e[2J"
		puts "Result: #{rslt.to_s}"
		print "Hit enter to exit: "
		rslt = eval(gets.chomp.sub(/\.0+$/, '').gsub(/\^|sin|cos|tan|sqrt|^0+/i, op))
	end

# Handling (SyntaxError) Caused by Invalid Syntax
# rescue SyntaxError => e
	# puts e
	# puts "Invalid Operator!"
	# sleep(1)

	# Handling (NameError) Caused by Invalid Input
	rescue NameError => e
		# puts e
		puts "Invalid Operation!"
		sleep(1)

	# Handling (ArgumentError) Caused by Invalid Number Arguments
	rescue ArgumentError => e
		# puts e
		puts "Invalid Number of Arguments!"
		sleep(1)

	# Handing ^C Interrrupt
	rescue Interrupt => e
		# puts e
		puts " Detected!"
		sleep(1)
	end
print "\e[H\e[2J"
