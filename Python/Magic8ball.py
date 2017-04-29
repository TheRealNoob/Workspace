import sys
import random

repeat=True

while (repeat == True):
    question = raw_input("Ask the magic 8 ball a question (press enter to quit):")
    
    if question == "":
        sys.exit()
    
    answer = random.randint(1,8)
    
    if answer == 1:
        print "It is certain."
    elif answer == 2:
        print "You can count on it."
    elif answer == 3:
        print "The outlook is good."
    elif answer == 4:
        print "Ask again later."
    elif answer == 5:
        print "Concentrate and try again."
    elif answer == 6:
        print "Answer unclear, try again."
    elif answer == 7:
        print "The outlook does not look good."
    elif answer == 8:
        print "My sources say no."