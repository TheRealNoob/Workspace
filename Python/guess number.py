# Setup
import random
Number = random.randrange(1,100)
print (Number)

print "Welcome to the Guess A Number Game!"
UserResponse = raw_input("Pick a number 1-100: ")
print ""

# Loop
while ((str(UserResponse).isnumeric()) == True): #Single redundancy check, but it's better than "While 1 == 1:"
    if (UserResponse) < (Number):
        UserResponse = raw_input("Too low!  Try again: ")
        print ""

    if (UserResponse) > (Number):
        UserResponse = raw_input("Too high!  Try again: ")
        print ""

    if (UserResponse) == (Number):
        print "Correct!"
        print ""
        break

raw_input("Press any key to exit")