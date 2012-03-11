require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  setup do
    @yelp_hash = {
      "country_code" => "CA",
      "city" => "Vancouver",
      "zip" => "V6J 5L1",
      "state" => "BC",
      "address1" => "1234 West 4th Avenue",
      "address2" => "Suite 103",
      "address3" => "",
      "phone" => "6041234567",
      "state_code" => "BC",
      "country" => "Canada"
    }
  end
  
  test "format_phone_number with 10 digit number in yelp hash" do
    assert_equal '(604) 123-4567', format_phone_number(@yelp_hash)
  end
  
  test "format_phone_number with 10 digit number" do
    phone_number = "604-123-4567"
    assert_equal '(604) 123-4567', format_phone_number(phone_number)
  end
  
  test "format_phone_number with 11 digit number" do
    phone_number = "+1 604-123-4567"
    assert_equal '(604) 123-4567', format_phone_number(phone_number)
  end
  
  test "format_phone_number with unknown format" do
    phone_number = "+1 604-123-4567 (ext 1234)"
    assert_equal phone_number, format_phone_number(phone_number)
  end
  
  test "format_address with multi-line address in yelp hash" do
    expected  = '<span class="line1">1234 West 4th Avenue</span>'
    expected += '<span class="line2">Suite 103</span>'
    expected += '<span class="city">Vancouver</span>'
    expected += '<span class="state">BC</span>'
    expected += '<span class="country">Canada</span>'
    expected += '<span class="zip">V6J 5L1</span>'
    
    assert_equal expected, format_address(@yelp_hash)
  end
  
  test "format_address with multi-line address" do
    expected  = '<span class="line1">1234 West 4th Avenue</span>'
    expected += '<span class="line2">Suite 103</span>'
    expected += '<span class="line3">Room 2</span>'
    expected += '<span class="city">Vancouver</span>'
    expected += '<span class="state">BC</span>'
    expected += '<span class="country">Canada</span>'
    expected += '<span class="zip">V6J 5L1</span>'
    
    assert_equal expected, format_address('1234 West 4th Avenue', 'Suite 103', 'Room 2', 'Vancouver', 'BC', 'Canada', 'V6J 5L1')
  end

  test "format_address with single-line address" do
    expected  = '<span class="line1">1234 West 4th Avenue</span>'
    expected += '<span class="city">Vancouver</span>'
    expected += '<span class="state">BC</span>'
    expected += '<span class="country">Canada</span>'
    expected += '<span class="zip">V6J 5L1</span>'

    assert_equal expected, format_address('1234 West 4th Avenue', nil, nil, 'Vancouver', 'BC', 'Canada', 'V6J 5L1')
  end
  
  test "format_address should escape HTML" do
    expected  = '<span class="line1">1234 West 4th Avenue</span>'
    expected += '<span class="line2">&lt;br /&gt;</span>'
    expected += '<span class="city">Vancouver</span>'
    expected += '<span class="state">BC</span>'
    expected += '<span class="country">Canada</span>'
    expected += '<span class="zip">V6J 5L1</span>'

    assert_equal expected, format_address('1234 West 4th Avenue', '<br />', nil, 'Vancouver', 'BC', 'Canada', 'V6J 5L1')
  end
end
