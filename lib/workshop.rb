class Workshop
	def initialize
		@slots = 3
	end

	def slots
		@slots
	end

	def fix(station)
		if station.check == []
			puts "No broken bikes in station"
		else
			bb = station.check
			bb.each { |bike| station.release(bike) }
			bb.each { |bike| bike.fix! if bike.broken? }
			bb.each { |bike| station.dock(bike) }
			puts "#All broken bike have been fixed and docked back at station"
			station.bikes
		end
	end
end