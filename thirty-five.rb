#project euler question 35
number_list = (2..1_000_000).to_a
index = 0
while index < 169 #goes through values of the number list and eliminating all multiples of that values
    number_list.delete_if do |x|
        x % number_list[index] == 0 && x != number_list[index]
    end
    index += 1
end

puts number_list.length

circular_primes = []

number_list.delete_if do |x| #optimizes the list by removing values that have 0, 2, 4, 5, 6, or 8 in them
    x.to_s.length > 1 && (x.to_s.include?('0') || x.to_s.include?('2') || x.to_s.include?('4') || x.to_s.include?('5') || x.to_s.include?('6') || x.to_s.include?('8'))
end

number_list.each do |p|
    p = p.to_s
    count = p.length
    prime_count = 0
    #if the length of the number is one, it is automatically circular prime
    if count == 1
        circular_primes.push(p.to_i)
    else
        while count > 0
            #pushes first digit to the end, then eliminates the first digit, thereby rotating the number
            p += p[0]
            p = p[1, p.length - 1]
            if number_list.include?(p.to_i)
                prime_count += 1 #checks to see if the new number is prime
            end
            count -= 1
        end

        if prime_count == p.length #checks to see how many number rotations are prime
            circular_primes.push(p.to_i) #if all rotations are prime, the the number is a circular prime
        end
    end
end

puts circular_primes.length