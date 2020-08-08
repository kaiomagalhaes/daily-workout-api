class WorkoutList < Set
  def full?(max_weight)
    sum { |exercise| exercise[:weight] } >= max_weight
  end

	def to_json
    to_a.sort do |a, b|
      a[:weight] - b[:weight]
    end.to_json
	end
end
