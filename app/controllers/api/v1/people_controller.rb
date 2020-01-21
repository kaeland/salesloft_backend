class Api::V1::PeopleController < ApplicationController
  def index  
    url = "https://api.salesloft.com/v2/people.json"
    response = Faraday.get(url) do |req|
      req.headers["Content-Type"] = "application/json"
      req.headers["Authorization"] = "Bearer #{ENV["SALESLOFT_API_KEY"]}"
    end 
    people = JSON.parse(response.body)

    render json: { people: people }, status: :ok 
  end
end
