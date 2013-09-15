json.array!(@leagues) do |league|
  json.extract! league, :wftda_league_id, :league_name, :location, :url, :seasons
  json.url league_url(league, format: :json)
end