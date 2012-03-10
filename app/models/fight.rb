class Fight < ActiveRecord::Base
  belongs_to :restaurant_1, :class_name => Restaurant
  belongs_to :restaurant_2, :class_name => Restaurant
  has_many :users
  
  def vote_for_1
    self.votes_for_1 ||= 0
    self.votes_for_1 += 1
    save
  end
  
  def vote_for_2
    self.votes_for_2 ||= 0
    self.votes_for_2 += 1
    save
  end
end
