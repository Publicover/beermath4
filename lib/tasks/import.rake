
require 'csv'

namespace :import do

  task :beers => :environment do
    csv_text = File.read("lib/beermath4.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Beer.create!(row.to_hash)

    # CSV.foreach("lib/beermath4.csv", headers: true, encoding: "ISO8859-1") do |row|
    #   Beer.create!(name: row["name"], brewer: row["brewer"],
    #     price: row["price"], ounce: row["ounce"], calorie: row["calorie"],
    #     rating: row["rating"], abv: row["abv"])
    end

  end

end

# namespace :import_beers_info do
#   task :create_beers_info => :environment do


    # csv_text = File.read("/Users/jpublicover/Desktop/beermath4.csv")
    # csv = CSV.parse(csv_text, :headers => true)
    # csv.each do |row|
    #   Beer.create!(row.to_hash)
    # end


#   end
# end


# CSV.foreach("lib/beermath4.csv", headers: true, encoding: "ISO8859-1") do |row|
#   Beer.new(name: row["name"], brewer: row["brewer"],
#     price: row["price"], ounce: row["ounce"], calorie: row["calorie"],
#     rating: row["rating"], abv: row["abv"])
# end
