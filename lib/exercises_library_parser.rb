class ExercisesLibraryParser
	def initialize
		@json = JSON.parse(File.read('./lib/exercises_library.json'))
	end

	def parse
		exercises = @json.map do |exercise|
			name = exercise["name"]
			puts exercise
			exercise["formats"].map do |format|
				{
					name: name,
					type: format["type"],
					amount: format["amount"],
					weight: format["weight"],
					id: "#{format["type"]}-#{format["amount"]}-#{format["weight"]}",
					combo_types: exercise["combo_types"]
				}
			end
		end.flatten

		exercises.group_by { |exercise| exercise[:weight] }
	end
end
