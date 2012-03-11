class Search < ActiveRecord::Base
  def response=(object)
    @response = object
    write_attribute(:response, object.to_json)
  end
  
  def response
    @response ||= JSON.parse(read_attribute(:response))
  end
end
