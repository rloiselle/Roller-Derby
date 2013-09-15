require 'json'
require 'open-uri'

class League
  attr_accessor(:wftda_league_id, :league_name, :location, :url, :seasons)

  def initialize
    @match_data = JSON.parse(open("http://rinxter.net/wftda/ds?type=league&leagueId=43&output=obj").read)
  end

  def formatdata
    # puts match_data.length
     match_data.map do |hash|
       hash.select do |key, value|
        if rails_attributes.include? key
          puts "the value for the " + key.to_s + " is: " + value.to_s
        end
      end
    end
  end

  def match_data
    @match_data
  end

  # names of columns in the rails database
  def rails_attributes
    ["id", "name", "location", "url", "seasons"]
  end

end

 l1 = League.new
 l1.formatdata
