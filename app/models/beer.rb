class Beer < ActiveRecord::Base
  before_save :abv_slash_cal, :abv_slash_price, :cal_slash_price,
              :cal_slash_ounce
  has_many :reviews, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }

# BREWERY_DB_KEY = #{ENV["BREWERY_DB_KEY"]}"
# brewery db request: http://api.brewerydb.com/v2/?key=#{ENV["BREWERY_DB_KEY"]}

  # def initialize
  #   @response = HTTParty.post("http://api.brewerydb.com/v2/?key=#{ENV["BREWERY_DB_KEY"]}")
  # end

  # call full database csv with
    # rake import:beers

  def initialize
    @brewery_db_response = JSON.parse(HTTParty.get("http://api.brewerydb.com/v2/beers/?key=#{ENV["BREWERY_DB_KEY"]}&name=bock"))
  end

  #incomplete here--might want to check exists

  def self.brewery_db_field
    @brewery_db_response["data"]["id"]
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  private

    def abv_slash_cal
      abvcal = (((self.abv.to_f * 0.1) * self.ounce * self.pack) / (self.calorie)).round(5)
      self.assign_attributes(abv_per_cal: abvcal)
    end

    def abv_slash_price
      abvdollar = (((self.abv.to_f * 0.1) * self.ounce * self.pack) / self.price).round(5)
      self.assign_attributes(abv_per_price: abvdollar)
    end

    def cal_slash_price
      calprice = ((self.calorie.to_f * self.pack) / self.price).round(5)
      self.assign_attributes(calorie_per_price: calprice)
    end

    def cal_slash_ounce
      calounce = ((self.calorie.to_f) / (self.ounce)).round(5)
      self.assign_attributes(calorie_per_ounce: calounce)
    end

end
