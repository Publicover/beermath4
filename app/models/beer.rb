class Beer < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true,
                   length: { minimum: 2 }
end
