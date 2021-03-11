
# Getting Input
print "\e[H\e[2J"
puts ">> Type <<"
puts "	[1] Easy Riddles"
puts "	[2] Riddles For Kids"
puts "	[3] Funny Riddles"
puts "	[4] Math Riddles"
puts "	[5] Word Riddles"
puts "	[6] Really Hard Riddles"
print "Choose: "
choice = gets.chomp().to_s

# Choose loop...
until (1..6).to_s.include?(choice)
	puts "Invalid choice #{choice}"
	print "Choose: "
	choice = gets.chomp()
end

# Choose file acccording to choice
opt = {
	"1" => file = File.open("Easy Riddles"),
	"2" => file = File.open("Riddles For Kids"),
	"3" => file = File.open("Funny Riddles"),
	"4" => file = File.open("Math Riddles"),
	"5" => file = File.open("Word Riddles"),
	"6" => file = File.open("Really Hard Riddles")
}

print "\e[H\e[2J"
score = 0
no_ques = 0

begin

	# Main loop
	for lines in opt[choice]

		# Get Question and Answer from the file
		prompt = lines.chomp()
		articles = {"the " => "", "an " => "", "a " => ""}
		answer = file.readline.chomp()

		# Make Question Object
		class Question
			attr_accessor :prompt, :answer
			def initialize(prompt, answer)
				@prompt = prompt
				@answer = answer
			end
		end

		# Questions and Answers
		question = Question.new(prompt, answer)

		# Ask Questions
		puts question.prompt
		answer = gets.chomp().sub(/^\w+\s/i, articles).gsub(/s\b/, "")
		puts question.answer
		file.readline
		if answer.casecmp(question.answer.partition('Answer: ').last.sub(/^\w+\s/i, articles).gsub(/s\b/, "")) == 0
			score += 1
		end
		no_ques += 1
	end

# Handling (EOFError) Caused by Invalid Input in File
rescue EOFError => e
	# puts e
	puts "Invalid Pattern/Structure in the file or Missing lines\nStructure:"
	puts "Question: <question>\nAnswer: <answer>\n<new-line>"

# Handing ^C Interrrupt
rescue Interrupt => e
	# puts e
	puts " Detected!"
	sleep(1)
end

# Output Score
puts ("You've Got "+ score.to_s + '/'+ no_ques.to_s)
sleep(4)
print "\e[H\e[2J"
