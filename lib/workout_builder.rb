require './lib/exercises_library_parser'
require './lib/workout_list'

class WorkoutBuilder
	WARM_UP_WEIGHT = 0
	MODERATE_EXERCISE_WEIGHT = 1
	HARD_EXERCISE_WEIGHT = 2
	IMPOSSIBLE_EXERCISE_WEIGHT = 3

	WARM_UP_EXERCISES_NUMBER = 2
	MODERATE_EXERCISE_NUMBER = 1
	HARD_EXERCISE_NUMBER = 1
	IMPOSSIBLE_EXERCISE_NUMBER = 1

	def initialize
		@workout = WorkoutList.new
		@exercises_by_weight = ExercisesLibraryParser.new.parse
		generate
	end

	def to_json(_)
		@workout.to_json
	end

	private

	def generate
		add_warm_up!
		add_moderate_workout!
		add_hard_workout!
		add_impossible_workout!
	end

	def add_warm_up!
		add_random_exercises_from_weight(WARM_UP_WEIGHT, WARM_UP_EXERCISES_NUMBER)
	end

	def add_moderate_workout!
		add_random_exercises_from_weight(MODERATE_EXERCISE_WEIGHT, MODERATE_EXERCISE_NUMBER)
	end

	def add_hard_workout!
		add_random_exercises_from_weight(HARD_EXERCISE_WEIGHT, HARD_EXERCISE_NUMBER)
	end

	def add_impossible_workout!
		add_random_exercises_from_weight(IMPOSSIBLE_EXERCISE_WEIGHT, IMPOSSIBLE_EXERCISE_NUMBER)
	end

	def add_random_exercises_from_weight(weight, quantity)
		new_workout_size = @workout.size + quantity

		until @workout.size == new_workout_size
      add_random_exercise_from_weight(weight)
		end
	end

	def add_random_exercise_from_weight(weight)
	  weight_exercises = @exercises_by_weight[weight]
	  @workout.add(weight_exercises.shuffle.first)
	end
end
