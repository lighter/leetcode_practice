# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
	isFirst = true
	result = '' 
	first_word = strs.first
	
	if strs.length == 1
		return first_word
	end
	
	
	(0..strs.length - 1).each do |i|

		if (isFirst && i < 1)
			result = find_same_prefix(strs[0], strs[1])		
			isFirst = false
		else 
			result = find_same_prefix(result, strs[i])
		end
	end
	
	return result
end

def find_same_prefix(arg1, arg2)
	tempPrefix = ''
	str_len = arg1.length
	
	(1..str_len).each do |i|
		if arg1[0, i] == arg2[0, i]
			tempPrefix = arg1[0, i]
		else
			break
		end
	end
	
	return tempPrefix
end

strs = ["c","c"]
pre = longest_common_prefix(strs)
p pre