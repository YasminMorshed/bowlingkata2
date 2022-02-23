require_relative '../bowling'

describe 'bowling score' do
	it 'returns nil if given nil' do
		bowling = Bowling.new
		expect(bowling.score(nil)).to be_nil
	end

	it 'returns 0 if given no rolls' do
		bowling = Bowling.new
		expect(bowling.score([])).to be_zero
	end

	it 'returns single roll as integer' do

		# Assign
		bowling = Bowling.new

		# Act
		bowl_int = bowling.score_bowl("5")

		# Assert
		expect(bowl_int).to eq(5)

	end

	it 'returns 10 if X' do

		# Assign
		bowling = Bowling.new

		# Act
		strike = bowling.strike_counter("X")

		# Assert
		expect(strike).to eq(10)

	end

	it 'returns score after frame' do

		# Assign
		bowling = Bowling.new

		# Act
		score = bowling.score_frame("45")

		# Assert
		expect(score).to eq(9)

	end

	it 'returns strike result thinking about next bowls' do

		# Assign
		bowling = Bowling.new

		# Act
		total_score = bowling.total_sum("X 45")

		# Assert
		expect(total_score).to eq(28)

	end

	it 'returns spare result thinking about next bowl' do

		# Assign
		bowling = Bowling.new

		# Act
		total_score = bowling.total_sum("4/ 45")

		# Assert
		expect(total_score).to eq(23)

	end

	it 'returns score on large number of bowls' do

		# Assign
		bowling = Bowling.new

		# Act
		total_score = bowling.total_sum("X 45 4/ 32")

		# Assert
		expect(total_score).to eq(46)

	end

	it 'returns score on three strikes' do

		# Assign
		bowling = Bowling.new

		# Act
		total_score = bowling.total_sum("X X X 45")

		# Assert
		expect(total_score).to eq(82)

	end
end