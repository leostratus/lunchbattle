class War < ActiveRecord::Base
  belongs_to :restaurant_1, :class_name => Restaurant
  belongs_to :restaurant_2, :class_name => Restaurant
end
