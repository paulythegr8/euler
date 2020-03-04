#project euler question 40

numbers=*(1..1000000) #array of all numbers up to one million
numbers = numbers.map {|x| x.to_s} #change all integers to strings
numbers = numbers.map {|x| x.chars} #separate each number into individual characters
numbers = numbers.flatten #flatten all of the arrays into one big array
indexes = [] #create array where all of the numbers will go
indexes.push(numbers[0], numbers[9], numbers[99], numbers[999], numbers[9999], numbers[99999], numbers[999999])
indexes = indexes.map {|x| x.to_i} #get our numbers back to integer form
product = indexes.inject(:*) #multiply them all together
print product