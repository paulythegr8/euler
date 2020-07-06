#project euler problem 87 trunctable primes left to right

#finds whether a number is prime (outputs one as prime, fix that)
def is_prime?(x)
    if x == 1
        return false
    end
    for n in (1..Math.sqrt(x).ceil)
        if x%n == 0 
            if n != 1 && n != x
                return false
            end
        end
    end
    return true
end

#if a number is prime, this function finds whether it is trunctable from left to right
def left_to_right(x)
    string = x.to_s
    len = string.length
    index = 1
    while index < len
        if is_prime?(string[index...len].to_i) == false
            return false
        end
        index += 1
    end
    return true
end

#if a number is prime, this function finds whether it is trunctable from right to left. 

def right_to_left(x)
    string = x.to_s
    index = string.length - 1
    while index > 0
        if is_prime?(string[0...index].to_i) == false
            return false
        end
        index -= 1
    end
    return true
end

#use all three functions together to find trunctable primes
satisfies = []
x = 10
while satisfies.length < 11
    if is_prime?(x)
        if right_to_left(x) && left_to_right(x)
            satisfies.push(x)
        end
    end
    x += 1
end

print satisfies.sum