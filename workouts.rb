class Workout
	WORKOUT_WEIGHT = 30

	def initialize
		@exercises = JSON.parse(File.read('./exercises.json'))
	end

	def generate
		processed_exercises = @exercises.map do |exercise|
			name = exercise["name"]
			puts exercise
			exercise["formats"].map do |format|
				{
					name: name,
					type: format["type"],
					amount: format["amount"],
					weight: format["weight"],
					id: "#{format["type"]}-#{format["amount"]}-#{format["weight"]}"
				}
			end
		end.flatten

		processed_exercises = processed_exercises.group_by { |exercise| exercise[:weight] }

		workout_weights = []

		while workout_weights.sum < WORKOUT_WEIGHT do
			workout_weights << rand(2..5)
		end

		workout_weights = workout_weights.sort


		w = []
		workout_weights.map do |weight|
			workouts = processed_exercises[weight]
			w << workouts.shuffle.first
    end
		w
	end
end
