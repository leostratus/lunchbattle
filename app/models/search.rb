class Search < ActiveRecord::Base
  def response=(object)
    @response = object
    write_attribute(:response, object.to_json)
  end
  
  def response
    @response ||= JSON.parse(read_attribute(:response)) unless read_attribute(:response).blank?
  end
  
  def search
    return true if response && (Time.now - self.updated_at < 1.day)
    
    # move this into some sort of async queue
    @client ||= Yelp::Client.new
    
    search_params = {
      :city => 'Vancouver',
      :state => 'BC',
      :yws_id => YELP_YWSID
    }
    
    search_params[:term] = self.query unless self.query.blank?
    search_params[:category] = self.category unless self.category.blank?
    
    request = Yelp::Review::Request::Location.new(search_params)
    temp_response = @client.search(request)
    
    puts temp_response.inspect
    
    if temp_response['message']['text'] == 'OK'
      self.response = temp_response['businesses']
      create_restaurants
      true
    else
      false
    end
  end
  
  private
  
  def create_restaurants
    if response && response.length > 0
      response.each do |r|
        Restaurant.create_or_update(r['id'],r)
      end
    end
  end
end
