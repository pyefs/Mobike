require './lib/workshop.rb'
require './lib/bike'
require './lib/station'

describe "Workshop" do
	describe "#slots" do
		it 'returns total number of slots' do
			workshop = Workshop.new
			expect(workshop.slots).to eql(3)
		end
	end
	describe "#fix(station, bike)" do
		it 'fixes bike lol' do
			station = Station.new
			bike1 = Bike.new
			bike2 = Bike.new
			bike1.break!
			station.dock(bike1)
			station.dock(bike2)
			workshop = Workshop.new
			workshop.fix(station)
			expect(station.check).to eql([])
		end
	end
end