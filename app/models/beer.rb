class Beer < ActiveRecord::Base
  before_save :cal_plus_ounce
  has_many :reviews, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }


  private
    def cal_plus_ounce
      sum_value = self.calorie + self.ounce
      self.assign_attributes(sum: sum_value)
    end


end

#comment here to check moving back a version in git
