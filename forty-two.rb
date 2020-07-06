#project euler question 42
#triangle words

triangle_translation = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8,
                        'i' => 9, 'j' => 10, 'k' => 11, 'l' => 12, 'm' => 13, 'n' => 14, 'o' => 15,
                        'p' => 16, 'q' => 17, 'r' => 18, 's' => 19, 't' => 20, 'u' => 21, 'v' => 22,
                        'w' =>23, 'x' => 24, 'y' => 25, 'z' => 26}

words = File.read('p042_words.txt').split(',') #downloaded text file directly from the project euler webpage describing the problem
triangular_words = []
words = words.map do |x|
    x = x[1..-2].downcase #gets rid of the quotation marks, makes everything lowercase
end

for w in words
    word_sum = 0
    tn = 1 #triangle_number
    for c in w.split("")
        word_sum += triangle_translation[c]
    end
    while word_sum > -1
        word_sum -= tn
        tn += 1
        if word_sum == 0
            triangular_words.push(w)
        end
    end
end

print triangular_words







