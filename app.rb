require 'sinatra'
require './workouts'

before do
  content_type :json
  body = request.body.read

  @body = JSON.parse body if !body.empty?
end

def render_json json
  response.body = JSON.dump(json)
end

get '/' do
	render_json(Workout.new.generate)
end

post '/' do
  render_json(@body)
end