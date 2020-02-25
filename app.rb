require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "d8e4a21792f867dbecd21c24219f037d"

get "/" do
  # show a view that asks for the location
  view "ask"
end

get "/news" do
    @place =params["location"]
   results = Geocoder.search(params["location"])
   lat_long =results.first.coordinates # => [lat,long]

    ForecastIO.api_key = "d8e4a21792f867dbecd21c24219f037d"

#dotheheavylifting, use Global Hub lat/long
@forecast = ForecastIO.forecast(lat_long[0],lat_long[1]).to_hash

# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`
@current_temperature = @forecast["currently"]["temperature"]
@current_conditions = @forecast["currently"]["summary"]
@current_date = @forecast["currently"]["summary"]

url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=83b119837dd84bdb828b4db9787c7313"
@news = HTTParty.get(url).parsed_response.to_hash
# news is now a Hash you can pretty print (pp) and parse for your output

view "show"
  # do everything else
end

