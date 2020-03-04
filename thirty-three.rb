#n[1] and d[0] must always be equal
n = 11  #numerator
d = 11  #denominator
numerators = [] #array of numerators of fractions that meet specification
denominators = [] #array of denominators of fractions that meet specification
while numerators.length < 4 && denominators.length < 4
   if (n.to_s[1] == d.to_s[0]) && (n.to_f/d.to_f == n.to_s[0].to_f/d.to_s[1].to_f) && ![0,1].include?(n.to_f/d.to_f)
       numerators.push(n.to_f)
       denominators.push(d.to_f)
       #pushes numerator and denominator into their respective arrays if the fractions created are =, not 1 or 0, and the digits I care about are the same
   end

   if d < 100
       d += 1 #increases d with each iteration if it is below 100

   else
       d = 11
       n += 1 #resets d and adds one to numerator if d = 100
   end 
   count += 1
end 
print "#{numerators}, #{denominators}\n"
numerators = numerators.inject(:*) #multiplies all of the numerators together
denominators = denominators.inject(:*) #multiplies all of the denominators together

print Rational(numerators, denominators).denominator #gives the final denominator we care about in lowest terms 