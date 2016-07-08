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


  private

    def abv_slash_cal
      if self.bomber
        abvcal = ((self.abv.to_f * 22) / (self.calorie)).round(5)
        self.assign_attributes(abv_per_cal: abvcal)
      elsif self.quantity
        abvcal = ((self.abv.to_f * 72) / (self.calorie * 6)).round(5)
        self.assign_attributes(abv_per_cal: abvcal)
      else
        abvcal = ((self.abv.to_f * 72) / (self.calorie * 4)).round(5)
        self.assign_attributes(abv_per_cal: abvcal)
      end
    end

    def abv_slash_price
      abvdollar = ((self.abv.to_f * 72) / self.price).round(5)
      self.assign_attributes(abv_per_price: abvdollar)
    end

    def cal_slash_price
      calprice = ((self.calorie.to_f * 6) / self.price).round(5)
      self.assign_attributes(calorie_per_price: calprice)
    end

    def cal_slash_ounce
      calounce = ((self.calorie.to_f * 6) / (self.ounce * 6)).round(5)
      self.assign_attributes(calorie_per_ounce: calounce)
    end

end
