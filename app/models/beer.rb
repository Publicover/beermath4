class Beer < ActiveRecord::Base
  validates :name, presence: true,
                   length: { minimum: 2 }
  has_many :reviews
end
