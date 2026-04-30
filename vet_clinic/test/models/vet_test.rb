require "test_helper"

class VetTest < ActiveSupport::TestCase
  def valid_vet
    Vet.new(
      first_name: "Carlos",
      last_name: "Lopez",
      email: "carlos_vet_test@example.com",
      phone: "111111111",
      specialization: "General Practice"
    )
  end

  test "valid vet can be saved" do
    vet = valid_vet

    assert vet.save
  end

  test "first_name is required" do
    vet = valid_vet
    vet.first_name = nil

    assert_not vet.valid?
    assert_includes vet.errors[:first_name], "can't be blank"
  end

  test "last_name is required" do
    vet = valid_vet
    vet.last_name = nil

    assert_not vet.valid?
    assert_includes vet.errors[:last_name], "can't be blank"
  end

  test "email is required" do
    vet = valid_vet
    vet.email = nil

    assert_not vet.valid?
    assert_includes vet.errors[:email], "can't be blank"
  end

  test "email must have a valid format" do
    vet = valid_vet
    vet.email = "invalid-email"

    assert_not vet.valid?
    assert_includes vet.errors[:email], "is invalid"
  end

  test "email must be unique" do
    Vet.create!(
      first_name: "Ana",
      last_name: "Martinez",
      email: "unique_vet@example.com",
      phone: "222222222",
      specialization: "Surgery"
    )

    vet = valid_vet
    vet.email = "unique_vet@example.com"

    assert_not vet.valid?
    assert_includes vet.errors[:email], "has already been taken"
  end

  test "specialization is required" do
    vet = valid_vet
    vet.specialization = nil

    assert_not vet.valid?
    assert_includes vet.errors[:specialization], "can't be blank"
  end
end