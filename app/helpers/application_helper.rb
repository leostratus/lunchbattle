module ApplicationHelper
  def format_phone_number(number)
    number = number['phone'] if number.is_a? Hash
    
    normalized_number = number.to_s.gsub(/[^0-9]/,'')
    
    normalized_number[0] = '' if normalized_number.length == 11 && normalized_number[0] == '1'
    
    if normalized_number.length == 10
      # 6041234567
      normalized_number.gsub(/([0-9]{3})([0-9]{3})([0-9]{4})/,"(\\1) \\2-\\3")
    else
      # unknown format, don't touch it
      Rails.logger.warn "Unknown phone number format: \"#{number}\""
      number
    end
  end
  
  def format_address(line1, line2 = nil, line3 = nil, city = nil, state = nil, country = nil, zip = nil)
    if line1.is_a? Hash
      y = line1
      
      line1   = y['address1']
      line2   = y['address2']
      line3   = y['address3']
      city    = y['city']
      state   = y['state']
      country = y['country']
      zip     = y['zip']
    end
    
    rtn  = ''
    rtn += '<span class="line1">'+escape_once(line1)+'</span>' unless line1.blank?
    rtn += '<span class="line2">'+escape_once(line2)+'</span>' unless line2.blank?
    rtn += '<span class="line3">'+escape_once(line3)+'</span>' unless line3.blank?
    rtn += '<span class="city">'+escape_once(city)+'</span>' unless city.blank?
    rtn += '<span class="state">'+escape_once(state)+'</span>' unless state.blank?
    rtn += '<span class="country">'+escape_once(country)+'</span>' unless country.blank?
    rtn += '<span class="zip">'+escape_once(zip)+'</span>' unless zip.blank?
    
    rtn.html_safe
  end
end
