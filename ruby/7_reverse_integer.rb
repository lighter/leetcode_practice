# @param {Integer} x
# @return {Integer}
def reverse(x)
    is_negative = false

    if x < 0
        is_negative = true
        x *= -1
    end

    x = x.to_s.split(//)
    xCount = x.count

    reverse_str = ''

    xCount.step(0, -1).each do |i|
       reverse_str += "#{x[i]}"
    end


    reverse_str = reverse_str.to_i
    reverse_str *= -1 if is_negative

    return 0 if reverse_str < -2147483648 || reverse_str > 2147483647
    return reverse_str
end

p reverse(123)
p reverse(-123)
