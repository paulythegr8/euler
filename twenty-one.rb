#project euler question 21 sum of all amicable numbers up to 10,000

#function returns the sum of the divisors of a number
def amicable(x)
    start = 1
    sum = 0
    #goes through all values from 1 to just over half of a number and adds them up
    while start < x/2 + 1
        if x%start == 0
            sum += start
        end
        start += 1
    end
    return sum
end

#creates a hash with each number as a key and its divisor sum as the value
number_hash = {}
key = 1

#loop pushes keys and their corresponding divisor sum into the hash
while key < 100000
    number_hash[key] = amicable(key)
    key += 1
end

sum = 0

for k in number_hash.keys
    m = number_hash[k]
    #takes the value of each hash key, makes that value a key, and then compares the value of the new key
    #to the original key to see if they're the same
    if number_hash[m] == k && m != k
        #if they're the same and they're not perfect numbers, the original key is added to the sum
        sum = sum + k
    end
end

print sum
