require './lib/rspec_challenge.rb'

describe "#addition_of_two(num1, num2)" do
	context 'when both are integers' do
		it 'adds both numbers' do
			expect(addition_of_two(2, 5)).to eql(7)
		end
	end
	context 'when one or both contains no number' do
		it 'gives an error message' do
			expect(addition_of_two(2, "a")).to eql('MUST BE NUMBER!!')
		end
	end
end

describe "#star_wars(name)" do
	context 'when name is on the jedi list' do
		it 'says i am a jedi' do
			expect(star_wars('luke')).to eql('I am a Jedi')
		end
	end
	context 'when name is on the sith list' do
		it 'says i am a sith' do
			expect(star_wars('vader')).to eql('I am a Sith')
		end
	end
	context 'when name falls on neither list' do
		it 'says i am no one' do
			expect(star_wars('amin')).to eql('I am no one. :(')
		end
	end
end

describe "#name_to_array(name)" do
	it 'splits name into character in an array' do
		expect(name_to_array("pye")).to eql(["p", "y", "e"])
	end
end