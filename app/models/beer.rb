class Beer < ActiveRecord::Base
  before_save :abv_slash_cal, :abv_slash_price
  has_many :reviews, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }


  private
    # def cal_plus_ounce
    #   sum_value = self.calorie + self.ounce
    #   self.assign_attributes(sum: sum_value)
    # end

    def abv_slash_cal
      abvcal = self.abv.to_f / self.calorie
      self.assign_attributes(abv_per_cal: abvcal)
    end

    def abv_slash_price
      abvdollar = self.abv.to_f / self.price
      self.assign_attributes(abv_per_price: abvdollar)
    end




end

#comment here to check moving back a version in git
