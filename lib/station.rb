class Station
	def initialize
		@capacity = 5
	end
	
	def capacity
		@capacity
	end
	def bikes
		@bikes ||= []
	end

	def peminjam
		@peminjam ||= []
	end

	def register(name)
		peminjam << name
	end

	def dock(bike)
		raise "Station is full!" if full?
		bikes << bike
	end

	def full?
		bikes.count == capacity
	end

	def release(bike)
		bikes.delete(bike)
	end

	def available_bike
		bikes.reject { |bike| bike.broken? }
	end

	def check
		bikes.select { |bike| bike.broken? } 
	end
end
