num = 600851475143

class Integer
	def prime?
		if self <= 1
			return false
		elsif (self == 2)
			return true
		end
		(2..Math.sqrt(self)).to_a.each do |x|
			if (self % x == 0) && (self / x != 1)
				return false
			end
		end
		return true
	end
end

def prime_factors(x)
	recurs_prime_factors(x, [])
end

def recurs_prime_factors(x, prime_factor)
	if x.prime?
		return "#{x} is a prime number"
	end

	(2..Math.sqrt(x)).to_a.each do |div|
		if (div.prime?) && (x % div == 0)
			prime_factor.push div
			factor = x / div
			if factor.prime?
				prime_factor.push factor
				return prime_factor.sort
			end
			return recurs_prime_factors(factor, prime_factor)
		end
	end
end

p "9 = #{prime_factors(9)}"
p "24 = #{prime_factors(24)}"
p "28 = #{prime_factors(28)}"
p "36 = #{prime_factors(36)}"
p "40 = #{prime_factors(40)}"
p "126 = #{prime_factors(126)}"
p "13195 = #{prime_factors(13195)}"
p "#{num} = #{prime_factors(num)}"