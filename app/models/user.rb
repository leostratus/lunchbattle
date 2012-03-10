class User < ActiveRecord::Base
  before_create :generate_token
  
  private
  
  def generate_token
    self.token = SecureRandom.uuid
  end
end
