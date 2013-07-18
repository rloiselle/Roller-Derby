require 'json'
require 'open-uri'

# myData = JSON.parse(open("http://rinxter.net/wftda/ds?type=boutList&leagueId=7&season=2012&output=obj").read)

class Tournament

  def initialize
    @match_data = JSON.parse(open("http://rinxter.net/wftda/ds?type=boutList&leagueId=7&season=2012&output=obj").read)
  end

  def formatdata
    match_data.map do |hash|
      puts "\n" + "---------------NEW BOUT------------------" + "\n" "\n"
      hash.select do |key, value|
          # puts key["date"]
        if rails_attributes.include? key
          puts "the value for the " + key + " is: " + value
        end
      end
      # puts hash.keys
      # val = hash.values_at("id", "date", "team1", "team1Score", "team2", "team2Score", "outcome")
      # val.each do |item|
      #   puts hash.key(item) + ": " + item
      # end
    end
  end

  # attr_reader :match_data

  def match_data
    @match_data
  end

  # names of columns in the rails database
  def rails_attributes
    ["id", "date", "team1", "team1Score", "team2", "team2Score", "outcome"]
  end

end

# puts myData[0]["sanction"]
# puts myData["tournament"]["artists"].map{|term| puts term["name"]}
# puts myData["tournament"].map{|term| puts term["id"]}

t1 = Tournament.new
t1.formatdata
# t1.getHashValue