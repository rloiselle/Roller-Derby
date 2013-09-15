require 'net/http'
require 'json'

# MOCK_MOVIES = '{"total"=>2, "movies"=>[{"id"=>"12875", "title"=>"Amelie",
#   "year"=>2001, "mpaa_rating"=>"R", "runtime"=>121, "critics_consensus"
#   =>"The feel-good Amelie is a lively, fanciful charmer, showcasing Audrey
#    Tautou as its delightful heroine.", "release_dates"=>{"theater"=>"2001-11-02",
#    "dvd"=>"2002-07-16"}, "ratings"=>{"critics_rating"=>"Certified Fresh",
#     "critics_score"=>90, "audience_rating"=>"Upright", "audience_score"=>95},
#     "synopsis"=>"", "posters"=>{"thumbnail"=>
#     "http://content7.flixster.com/movie/11/15/56/11155625_mob.jpg",
#     "profile"=>"http://content7.flixster.com/movie/11/15/56/11155625_pro.jpg",
#     "detailed"=>"http://content7.flixster.com/movie/11/15/56/11155625_det.jpg",
#     "original"=>"http://content7.flixster.com/movie/11/15/56/11155625_ori.jpg"},
#     "abridged_cast"=>[{"name"=>"Audrey Tautou", "id"=>"162668443",
#       "characters"=>["AmA?lie", "Amelie", "Am?lie"]}, {"name"=>"Mathieu Kassovitz",
#         "id"=>"162684072", "characters"=>["Nino Quincampoix"]}, {"name"=>"Rufus",
#           "id"=>"326390865", "characters"=>["Raphael Poulain (AmA?lie's father)",
#             "Raphael Poulain (Amelie's father)", "Raphael Poulain (Am?lie's father)"]}, {"name"=>"Yolande Moreau", "id"=>"335719867", "characters"=>["Madeleine Wallace"]}, {"name"=>"Artus de Penguern", "id"=>"343033782", "characters"=>["Hipolito (the writer)"]}], "alternate_ids"=>{"imdb"=>"0211915"}, "links"=>{"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/12875.json", "alternate"=>"http://www.rottentomatoes.com/m/amelie/", "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/12875/cast.json", "clips"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/12875/clips.json", "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/12875/reviews.json", "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/12875/similar.json"}}], "links"=>{"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=amelie&page_limit=1&page=1", "next"=>"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=amelie&page_limit=1&page=2"}, "link_template"=>"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q={search-term}&page_limit={results-per-page}&page={page-number}"}'

def get_google_distance(from, to)
  url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{from}&destinations=#{12345}&sensor=false"
  uri_obj = URI(url)
  response = Net::HTTP.get_response(uri_obj)
  return JSON.parse(response.body)
end

def get_rt(movie_name)
  api_key = 'jxypaa7s2waqe6mzq7c9nda7'
  url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{api_key}&q=#{movie_name}&page_limit=1&_prettyprint=true"
  uri_obj = URI(url)
  response = Net::HTTP.get_response(uri_obj)
  return JSON.parse(response.body)
end


# puts get_google_distance(97214,12345)
puts
h = get_rt('amelie')
puts h["movies"].first["release_dates"]["theater"]


