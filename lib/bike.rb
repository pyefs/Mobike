
class Bike
	def initialize
		@broken = false
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
		#self.broken?
	end

	def fix!
		@broken = false
		#self.broken?
	end

end