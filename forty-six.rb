def is_prime?(n) #takes an integer, returns a boolean of whether its prime or not
    if n == 1
        return false
    end
    for i in (1.. n/2 + 1)
        if n % i == 0 && (i != 1 && i != n)
            return false
        end
    end
    return true
end

def plt(n) #takes an integer, returns a list of all primes less than a given odd composite integer
    primes = []
    for i in (2..n-1)
        if is_prime?(i)
            primes.push(i)
        end
    end
    #print primes
    return primes
end


def find_equation(n) #takes a number, returns true if there is an equation that represents it, or false if there is none
    for p in plt(n)
        if Math.sqrt((n - p)/2) == Math.sqrt((n - p)/2).to_i
            #print "#{p} + 2*#{Math.sqrt((n-p)/2).to_i}^2"
            return true
        end
    end
    return false
end


satisfies = nil
num = 9
while satisfies == nil && num < 15000
    if num % 2 == 1 && !is_prime?(num)
        if !find_equation(num)
            satisfies = num
        end
    end
    num += 2
end

print satisfies

