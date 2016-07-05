class Beer < ActiveRecord::Base
  before_save
  has_many :reviews, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }

  def get_abv_per_cal
    self.get_abv_per_cal = calorie.to_f / abv
    # (self.get_abv_per_cal).save
  end


end

#comment here to check moving back a version in git
