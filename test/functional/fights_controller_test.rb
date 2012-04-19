require 'test_helper'

class FightsControllerTest < ActionController::TestCase
  setup do
    @fight = fights(:one)
  end

  test "should create fight" do
    assert_difference('Fight.count') do
      post :create, fight: @fight.attributes
    end

    assert_redirected_to fight_path(assigns(:fight))
  end

  test "should show fight" do
    get :show, id: @fight
    assert_response :success
  end
  
  test "should vote for 1" do
    put :vote_for_1, id: @fight
    assert_response :success
  end
  
  test "should vote for 2" do
    put :vote_for_2, id: @fight
    assert_response :success
  end
end
