class Weather < Widget
    description "Weather checker"
    dependency "rexml/document", "Standard library"
    dependency "uri", "Standard library"
    dependency "open-uri", "Standard library"
    option :location, "Location", ""
    option :unit, "Temperature unit (c or f)", "c"
    option :locid, "Location ID", "BEXX0008"
    field :city, "City", ""
    field :region, "Region or State", ""
    field :country, "Country", ""
    field :pressure_unit, "Pressure units", ""
    field :speed_unit, "Speed units", ""
    field :temperature_unit, "Temperature units", ""
    field :distance_unit, "Distance unit", ""
    field :wind_chill, "Wind chill", 0
    field :wind_speed, "Wind speed", 0
    field :wind_direction, "Wind direction", 0
    field :visibility, "Visibility", 0
    field :humidity, "Humidity", 0
    field :pressure, "Barometric pressure", 0
    field :sunset, "Sunset time", ""
    field :sunrise, "Sunrise time", ""
    field :latitude, "Geographic latitude", 0
    field :longitude, "Geographic longitude", 0
    field :temperature, "Current temperature", 0
    field :condition, "Current weather condition", ""
    field :high, "Today's high forecast", 0
    field :low, "Today's low forecast", 0
    field :condition_forecast, "Today's forecasted condition", ""
    default '"text #@temperature"'

    init do
		    if @locid == "" then
                 	@location = URI.escape(@location)
                 	url = "http://xoap.weather.com/search/search?where=#{@location}"
                 	xml = open(url) { |f| f.read }
                 	doc = REXML::Document.new(xml)
                 	locations = doc.elements.to_a("/search/loc")
                 	widgetraise "Cannot find location" unless locations.size > 0
                 	@locid = locations[0].attributes['id']
		 end
                 url = "http://xml.weather.yahoo.com/forecastrss/#{@locid}_#{@unit.downcase}.xml"
                 xml = open(url) { |f| f.read }
                 doc = REXML::Document.new(xml)
                 @city = doc.elements['/rss/channel/yweather:location/@city'].to_s
                 @region = doc.elements['/rss/channel/yweather:location/@region'].to_s
                 @country = doc.elements['/rss/channel/yweather:location/@country'].to_s
                 @pressure_unit = doc.elements['/rss/channel/yweather:units/@pressure'].to_s
                 @speed_unit = doc.elements['/rss/channel/yweather:units/@speed'].to_s
                 @temperature_unit = doc.elements['/rss/channel/yweather:units/@temperature'].to_s
                 @distance_unit = doc.elements['/rss/channel/yweather:units/@distance'].to_s
                 @wind_chill = doc.elements['/rss/channel/yweather:wind/@chill'].to_s.to_i
                 @wind_speed = doc.elements['/rss/channel/yweather:wind/@speed'].to_s.to_i
                 @wind_direction = doc.elements['/rss/channel/yweather:wind/@direction'].to_s.to_i
                 @visibility = doc.elements['/rss/channel/yweather:atmosphere/@visibility'].to_s.to_i
                 @humidity = doc.elements['/rss/channel/yweather:atmosphere/@humidity'].to_s.to_i
                 @pressure = doc.elements['/rss/channel/yweather:atmosphere/@pressure'].to_s.to_f
                 @sunset = doc.elements['/rss/channel/yweather:astronomy/@sunset'].to_s
                 @sunrise = doc.elements['/rss/channel/yweather:astronomy/@sunrise'].to_s
                 @latitude = doc.elements['/rss/channel/item/geo:lat'][0].to_s.to_f
                 @longitude = doc.elements['/rss/channel/item/geo:long'][0].to_s.to_f
                 @temperature = doc.elements['/rss/channel/item/yweather:condition/@temp'].to_s.to_i
                 @condition = doc.elements['/rss/channel/item/yweather:condition/@text'].to_s
                 @high = doc.elements['/rss/channel/item/yweather:forecast/@high'].to_s.to_i
                 @low = doc.elements['/rss/channel/item/yweather:forecast/@low'].to_s.to_i
                 @condition_forecast = doc.elements['/rss/channel/item/yweather:forecast/@text'].to_s
            end
        end
