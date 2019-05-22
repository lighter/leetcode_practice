#!/usr/bin/ruby

def is_valid(s)
	status = true
  	stack = []

	return false if s.length == 1 
	
	s.each_char do |w|
		if (['(', '[', '{']).include? w
			stack.push(w)
		else 
			last = stack.last
		    case w
			when ')'
				last == '(' ? stack.pop : status = false
			when ']'
				last == '[' ? stack.pop : status = false
			when '}'
			    last == '{' ? stack.pop : status = false
			end
		end
	end
	
	return status && stack.count == 0
end