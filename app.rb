require 'sinatra'
require './lib/workout_builder'

before do
  content_type :json
  body = request.body.read

  @body = JSON.parse body if !body.empty?

  response.headers['Access-Control-Allow-Origin'] = '*'
end

def render_json json
  response.body = JSON.dump(json)
end

get '/' do
	render_json(WorkoutBuilder.new)
end

post '/' do
  render_json(@body)
end