class User
	def initialize(name)
		@name = name
		@bike = nil
	end
	def name
		@name
	end

	def has_bike?
		!@bike.nil? 
	end

	def rent_bike(station)
		raise "User already rented a bike" if station.peminjam.include?(self.name)
		#raise "Can't rent broken bike" if @bike.broken?
		@bike = station.available_bike.first
		station.release(@bike)
		station.register(self.name)
	end

	def return_bike_to(station, bike)
		raise "User does not have a bike" if @bike == nil
		#station.release(@bike)
		station.dock(@bike)
		station.peminjam.delete(self.name)
		@bike = nil
	end

	def falldown?
		@bike.break!
	end
end
