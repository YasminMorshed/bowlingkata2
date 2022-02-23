class Bowling
	def score(rolls)
		return nil if rolls.nil?

		0
	end

	def score_bowl(roll)
		roll.to_i
	end

	def strike_counter(roll)
		if roll == "X"
			10
		end
	end

	def score_frame(frame)
		bowls = frame.split("")
		score = bowls.reduce(0) { |sum, num| score_bowl(sum) + score_bowl(num) }
	end

	def total_sum(bowls)
		bowls = bowls.split(" ") # ["X", "45"]
		total_score = 0

		bowls.each_with_index do |bowl, index|
			if bowl == "X"
				total_score += 10
				total_score += score_frame(bowls[index + 1])
				if bowls[index + 1] == "X"
					total_score += score_frame(bowls[index + 2])
				end
			elsif bowl[1] == "/"
				total_score += 10
				next_hit = bowls[index + 1].split("")[0]
				total_score += next_hit.to_i
			elsif bowl.to_i != nil
				total_score += score_frame(bowl)
			end
		end

		return total_score
			
	end
end