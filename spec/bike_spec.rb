require './lib/bike.rb'

describe "Bike" do
	describe "#broken?" do
		it 'returns bike condition' do
			bike1 = Bike.new
			expect(bike1.broken?).to eql(false)
		end
	end
	describe "#break!" do
		it 'sets bike condition to broken' do
			bike1 = Bike.new
			expect(bike1.break!).to eql(true)
		end
	end
	describe "#fix!" do
		it 'sets bike condition to not broken' do
			bike1 = Bike.new
			expect(bike1.fix!).to eql(false)
		end
	end
end
