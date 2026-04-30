require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get show" do
    owner = Owner.create!(
      first_name: "Test",
      last_name: "Owner",
      email: "pet_owner_test@example.com",
      phone: "123456789",
      address: "Santiago"
    )

    pet = Pet.create!(
      name: "Firulais",
      species: "dog",
      breed: "Labrador",
      date_of_birth: Date.new(2020, 5, 10),
      weight: 25.5,
      owner: owner
    )

    get pet_url(pet)
    assert_response :success
  end
end