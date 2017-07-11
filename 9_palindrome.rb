# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
    isPalidrome = true
    x = x.to_i
    return false if x < 0
    return true if x.to_s.split(//).count == 1


    endNum = x.to_s.split(//).count
    startNum = 0
    forLoop = (endNum / 2) - 1
    x = x.to_s.split(//)

    for i in 0..forLoop
        if x[startNum + i] != x[(endNum - 1) - i]
            isPalidrome = false
        end
    end

    return isPalidrome
end

p is_palindrome(1221)
p is_palindrome(1234)
p is_palindrome(-2147483648)
p is_palindrome(121)
p is_palindrome(0)
