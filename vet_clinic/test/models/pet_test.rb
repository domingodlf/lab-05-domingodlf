require "test_helper"

class PetTest < ActiveSupport::TestCase
  def valid_owner
    Owner.create!(
      first_name: "Pet",
      last_name: "Owner",
      email: "pet_owner_model_test@example.com",
      phone: "123456789",
      address: "Santiago"
    )
  end

  def valid_pet
    Pet.new(
      name: "Firulais",
      species: "dog",
      breed: "Labrador",
      date_of_birth: Date.new(2020, 5, 10),
      weight: 25.5,
      owner: valid_owner
    )
  end

  test "valid pet can be saved" do
    pet = valid_pet

    assert pet.save
  end

  test "name is required" do
    pet = valid_pet
    pet.name = nil

    assert_not pet.valid?
    assert_includes pet.errors[:name], "can't be blank"
  end

  test "species is required" do
    pet = valid_pet
    pet.species = nil

    assert_not pet.valid?
    assert_includes pet.errors[:species], "can't be blank"
  end

  test "species must be included in allowed list" do
    pet = valid_pet
    pet.species = "horse"

    assert_not pet.valid?
    assert_includes pet.errors[:species], "is not included in the list"
  end

  test "date_of_birth is required" do
    pet = valid_pet
    pet.date_of_birth = nil

    assert_not pet.valid?
    assert_includes pet.errors[:date_of_birth], "can't be blank"
  end

  test "date_of_birth cannot be in the future" do
    pet = valid_pet
    pet.date_of_birth = Date.tomorrow

    assert_not pet.valid?
    assert_includes pet.errors[:date_of_birth], "can't be in the future"
  end

  test "weight is required" do
    pet = valid_pet
    pet.weight = nil

    assert_not pet.valid?
    assert_includes pet.errors[:weight], "can't be blank"
  end

  test "weight must be greater than zero" do
    pet = valid_pet
    pet.weight = 0

    assert_not pet.valid?
    assert_includes pet.errors[:weight], "must be greater than 0"
  end

  test "owner is required" do
    pet = valid_pet
    pet.owner = nil

    assert_not pet.valid?
    assert_includes pet.errors[:owner], "must exist"
  end
end