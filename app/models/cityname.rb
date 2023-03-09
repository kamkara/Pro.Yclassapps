class Cityname < ApplicationRecord
  belongs_to :user

  #Slugged concern
  include ItemsSlugged
end
