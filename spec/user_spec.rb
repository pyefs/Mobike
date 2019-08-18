require './lib/user.rb'
require './lib/bike'
require './lib/station'

describe "User" do
	let (:user) { User.new("pye") }
	let (:station) { Station.new }
	let (:bike1) { Bike.new }
	let (:bike2) { Bike.new }
	describe "#name" do
		it 'returns name' do
			expect(user.name).to eql("pye")
		end
	end
	describe "#has_bike?" do
		context 'when user has no bike' do
			it 'returns false' do
				expect(user.has_bike?).to eql(false)
			end
		end
		context 'when user has a bike' do
			it 'returns bike rented' do
				station.dock(bike1)
				user.rent_bike(station)
				expect(user.has_bike?).to eql(true)
			end
		end
	end
	describe "#rent_bike(station)" do
		context 'when user already has a bike' do
			it 'raises error' do
				station.dock(bike1)
				user.rent_bike(station)
				expect{user.rent_bike(station)}.to raise_error(RuntimeError, "User already rented a bike")
			end
		end
		context 'when user does not have a bike' do
			it 'gives user a bike and register the user' do
				station.dock(bike1)
				expect(user.rent_bike(station)).to eql(["pye"])
			end
		end
	end
	describe "#return_bike_to(station, bike)" do
		context 'when user does not have a bike' do
			it 'raises error' do
				station.dock(bike1)
				user.rent_bike(station)
				user.return_bike_to(station, bike1)
				expect{user.return_bike_to(station, bike1)}.to raise_error(RuntimeError, "User does not have a bike")
			end
		end
		context 'when user has a bike' do
			it 'returns bike to station lol' do
				station.dock(bike1)
				user.rent_bike(station)
				expect(user.return_bike_to(station, bike1)).to eql(nil)
			end
		end
	end
	describe "#falldown?" do
		it 'sets bike condition to broken' do
			station.dock(bike1)
			user.rent_bike(station)
			expect(user.falldown?).to eql(true)
		end
	end
end
