require 'json'
require 'open-uri'

class Team
  attr_accessor(:wftda_team_id, :team_name, :leagueId, :league_name)

  def initialize
    @match_data = JSON.parse(open("http://rinxter.net/wftda/ds?type=teamList&leagueId=43&output=obj").read)
  end

  def formatdata
    # puts match_data.length
    match_data.map do |hash|
      hash.select do |key, value|
        if rails_attributes.include? key
          puts "the value for the " + key + " is: " + value
        end
      end
    end
  end

  # attr_reader :match_data

  def match_data
    @match_data
  end

  # names of columns in the rails database
  def rails_attributes
    ["id", "name", "leagueId", "league"]
  end

end

t1 = Team.new
t1.formatdata