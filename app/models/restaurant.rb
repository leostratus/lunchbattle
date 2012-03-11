class Restaurant < ActiveRecord::Base
  def self.create_or_update(yelp_id, response)
    restaurant = Restaurant.find_by_yelp_id(yelp_id)
    
    if restaurant
      restaurant.update_attributes({:response => response})
    else
      Restaurant.create({:yelp_id => response['id'], :response => response})
    end
  end
  
  
  def response=(object)
    @response = object
    write_attribute(:response, object.to_json)
  end
  
  def response
    @response ||= JSON.parse(read_attribute(:response)) unless read_attribute(:response).blank?
  end
end
