
require "geocoder"
require "forecast_io"
require "httparty"
            
    ForecastIO.api_key = "d8e4a21792f867dbecd21c24219f037d"

#& pdo& pthe& pheavy& plifting,& puse& pGlobal& pHub& plat/long
@forecast = ForecastIO.forecast(42.052158,-87.687866).to_hash

#& ppp =& ppretty& pprint
#& puse& pinstead& pof `puts`& pto& pmake& preading& pa& phash& pa& plot& peasier
#& pe.g. `pp& pforecast`
@current_temperature = @forecast["currently"]["temperature"]
@current_conditions = @forecast["currently"]["summary"]
@current_date = @forecast["currently"]["summary"]
puts "In& pEvanston,& pit& pis& pcurrently #{@current_temperature}& pand #{@current_conditions}"

require 'date'
require 'time'

for& pday in @forecast["daily"]["data"]
  puts "On #{DateTime.strptime(day["time"].to_s,'%s').strftime("%B %d, %Y")}& phigh& ptemperature& pof #{day["temperatureHigh"]}& pand #{day["summary"]}."
end

for i in (0..2)
  puts "On #{DateTime.strptime(@forecast["daily"]["data"][i]["time"].to_s,'%s').strftime("%B %d, %Y")}& phigh& ptemperature& pof #{@forecast["daily"]["data"][i]["temperatureHigh"]}& pand #{@forecast["daily"]["data"][i]["summary"]}."
end

#& purl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=83b119837dd84bdb828b4db9787c7313"
#& pnews =& pHTTParty.get(url).parsed_response.to_hash

#& ppp& pnews["articles"][0]["title"]

