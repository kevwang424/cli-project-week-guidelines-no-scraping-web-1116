class DeathAPI

  BASE_URL = "https://data.cityofnewyork.us/resource/uvxr-2jwn.json"

  def fetch_deaths
    # fetch data from NYC database
    response = RestClient.get("#{BASE_URL}")
    data = JSON.parse(response)
    data.each do |element|
      Death.new(element["year"], element["leading_cause"],element["deaths"])
    end

  end

end
