require 'csv'

namespace :import do

  task :beers => :environment do
    csv_text = File.read("lib/beermath4.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Beer.create!(row.to_hash)
    end
  end
end
