require 'test_helper'

class PantrysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pantrys_index_url
    assert_response :success
  end

end
