print "Welcome to the Pig Latin Translator!"
print "We can convert any word into Pig Latin for you!"
print "Make sure that you are using the American English keyboard, and that your input is at least 3 letters in length"

# Input
while (1 == 1):
	print ""
	Input = raw_input('Enter a word: ').lower()
	if (str(Input).isalpha() == True) and (len(Input) >= 2):
		break # Exit loop
	else:
		print "Error! Invalid input.  Try again." # Retry loop

# Conversion
Pig_Latin = (Input[1:] + Input[:1] + "ay").capitalize()

# Output
print ""
print "Pig Latin output: ", Pig_Latin