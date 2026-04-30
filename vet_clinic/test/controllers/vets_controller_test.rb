require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should get show" do
    vet = Vet.create!(
      first_name: "Test",
      last_name: "Vet",
      email: "vet_test@example.com",
      phone: "123456789",
      specialization: "Surgery"
    )

    get vet_url(vet)
    assert_response :success
  end
end