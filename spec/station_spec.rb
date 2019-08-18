require './lib/station.rb'
require './lib/bike'
require './lib/user'

describe "Station" do
	let (:station) { Station.new }
	let (:user) { User.new("default user") }
	let (:bike1) { Bike.new }
	let (:bike2) { Bike.new }
	let (:bike3) { Bike.new }
	let (:bike4) { Bike.new }
	let (:bike5) { Bike.new }
	describe "#register(name)" do
		it 'marks users who gets a bike' do
			# user = User.new("amin")
			# station0 = Station.new
			expect(station.register("default user")).to eql(["default user"])
		end
	end
	describe "#capacity" do
		it 'returns station capacity' do
			expect(station.capacity).to eql(5)
		end
	end
	describe "#bikes" do
		it 'returns list of bikes' do
			# w = Station.new
			# w1 = Bike.new
			# w2 = Bike.new
			# w.dock(w1)
			# w.dock(w2)
			station.dock(bike1)
			station.dock(bike2)
			expect(station.bikes).to eql([bike1, bike2])
		end
	end
	describe "#peminjam" do
		it 'returns list of users with bikes' do
			# user = User.new("amin")
			# stations = Station.new
			station.register("default user")
			expect(station.peminjam).to eql(["default user"])
		end
	end
	describe "#full?" do
		context 'when bikes = capacity' do
			it 'returns true' do
				station.dock(bike1)
				station.dock(bike2)
				station.dock(bike3)
				station.dock(bike4)
				station.dock(bike5)
				expect(station.full?).to eql(true)
			end
		end
		context 'when bikes < capacity' do
			it 'returns false' do
				station.dock(bike1)
				station.dock(bike2)
				expect(station.full?).to eql(false)
			end
		end
	end
	describe "#dock(bike)" do
		context 'when station is not full?' do
			it 'adds bike to bikes list' do
				station.dock(bike1)
				station.dock(bike2)
				expect(station.dock(bike3)).to eql([bike1, bike2, bike3])
			end
		end	
		context 'when station is full?' do
			it 'gives an error message' do
				bike6 = Bike.new
				station.dock(bike1)
				station.dock(bike2)
				station.dock(bike3)
				station.dock(bike4)
				station.dock(bike5)
				expect{station.dock(bike6)}.to raise_error(RuntimeError, "Station is full!")
			end
		end
	end
	describe "#release(bike)" do
		it 'removes bike from list' do
			station.dock(bike1)
			station.dock(bike2)
			station.release(bike2)
			expect(station.bikes).to eql([bike1])
		end
	end
	describe "#available_bike" do
		it 'removes broken bikes from list' do

			station.dock(bike1)
			station.dock(bike2)

			bike2.break!

			expect(station.available_bike).to eq([bike1])
		end
	end

	describe "#check" do
		it "check for broken bikes" do
			station.dock(bike1)
			station.dock(bike2)
			bike1.break!
			expect(station.check).to eql([bike1])
		end
	end

end