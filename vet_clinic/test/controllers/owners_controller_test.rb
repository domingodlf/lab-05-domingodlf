require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should get show" do
    owner = Owner.create!(
      first_name: "Test",
      last_name: "Owner",
      email: "owner_test@example.com",
      phone: "123456789",
      address: "Santiago"
    )

    get owner_url(owner)
    assert_response :success
  end
end