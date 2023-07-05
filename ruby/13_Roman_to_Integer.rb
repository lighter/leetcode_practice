# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000
def roman_to_int(s)

    sum = 0
    words = s.chars

    words.to_enum.with_index.reverse_each do |word, index|

        if index == words.length - 1
            sum += num_is(word)
        else
            if (index - 1 >= -1)
                curr = num_is(word)
                pre = num_is(words[index+1])

                if (pre > curr)
                    sum -= curr
                else
                    sum += curr
                end
            end

        end
    end

    return sum
end

def num_is(word)
    case word
    when 'I'
        num_a = 1
    when 'V'
        num_a = 5
    when 'X'
        num_a = 10
    when 'L'
        num_a = 50
    when 'C'
        num_a = 100
    when 'D'
        num_a = 500
    when 'M'
        num_a = 1000
    end
end

puts roman_to_int('XCIX') # 99
puts roman_to_int('IX') # 9
puts roman_to_int('XIV') # 14
puts roman_to_int('DCXXI') # 621
