#project euler problem 69 n/totient(n)
#step one create a function that finds prime factors
#step two do this for every number below your number and intersect them to see if they are relatively prime

def relatively_prime?(x, y)
    x_factors = [x]
    y_factors = [y]
    divisor = 2
    while x > 1
        if x%divisor == 0
            x = x/divisor
            x_factors.push(divisor)
            divisor = 2
        else
            divisor += 1
        end
    end
    x_factors = x_factors.uniq

    divisor = 2
    while y > 1
        if y%divisor == 0
            if x_factors.include?(divisor)
                return false
            else 
                y = y/divisor
                y_factors.push(divisor)
                divisor = 2
            end
        else
            divisor += 1
        end
    end

    return true
end


n = 2
multiplier = 2 #for later use
number_of_coprimes = 0.0
biggest = 1
totient = 0
while n <= 125000
    if n%2 == 0
        for i in (1..n).step(2)
            if relatively_prime?(i, n) == true
                number_of_coprimes += 1
            end
        end
    else
        for i in (1..n)
            if relatively_prime?(i, n) == true
                number_of_coprimes += 1
            end
        end
    end
    if n/number_of_coprimes > totient
        totient = n/number_of_coprimes
        biggest = n
    end
    number_of_coprimes = 0.0
    n = n + biggest
end
puts biggest, totient