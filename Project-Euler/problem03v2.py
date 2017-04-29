import math

inputnumber = 600851475143
numerator = inputnumber
denominator = 2
primefactors = []
holder = 1

while denominator >= math.sqrt(numerator):
    if numerator % denominator == 0:
        primefactors.append(denominator)
        numerator = numerator / denominator
        denominator = 2
    else:
        denominator += 1

for item in primefactors:
    holder = holder * item

if holder * numerator == inputnumber:
    primefactors.append(numerator)

print primefactors