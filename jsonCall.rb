require 'json'
require 'open-uri'

class Bouts

  attr_accessor(:wftda_bout_id, :team1_name, :team2_name )

  def initialize
    @match_data = JSON.parse(open("http://rinxter.net/wftda/ds?type=boutList&teamId=85&season=2012&output=obj").read)
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
    end
  end

  # attr_reader :match_data

  def match_data
    @match_data
  end

  # names of columns in the rails database
  def rails_attributes
    ["id", "team1", "team2"]
  end

end

class BoutSummary

  attr_accessor(:wftda_bout_id, :param,:team1tot, :team2tot )

  def initialize
    @match_data = JSON.parse(open("http://rinxter.net/wftda/ds?type=boutSummary&boutId=378&output=obj").read)
  end

  def formatdata
    match_data.map do |hash|
      puts "\n" + "---------------NEW Parameter------------------" + "\n" "\n"
      hash.select do |key, value|
           # puts key + ": " + value
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
    ["id", "param", "team1tot","team2tot"]
  end

end

b1 = Bouts.new
b1.formatdata

bs1 = BoutSummary.new
bs1.formatdata
