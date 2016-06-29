class Beer < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }
end

#comment here to check moving back a version in git
