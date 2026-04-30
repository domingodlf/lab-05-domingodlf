require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  def valid_owner
    Owner.new(
      first_name: "Domingo",
      last_name: "De la Fuente",
      email: "domingo_owner_test@example.com",
      phone: "123456789",
      address: "Lo Barnechea"
    )
  end

  test "valid owner can be saved" do
    owner = valid_owner

    assert owner.save
  end

  test "first_name is required" do
    owner = valid_owner
    owner.first_name = nil

    assert_not owner.valid?
    assert_includes owner.errors[:first_name], "can't be blank"
  end

  test "last_name is required" do
    owner = valid_owner
    owner.last_name = nil

    assert_not owner.valid?
    assert_includes owner.errors[:last_name], "can't be blank"
  end

  test "email is required" do
    owner = valid_owner
    owner.email = nil

    assert_not owner.valid?
    assert_includes owner.errors[:email], "can't be blank"
  end

  test "email must have a valid format" do
    owner = valid_owner
    owner.email = "invalid-email"

    assert_not owner.valid?
    assert_includes owner.errors[:email], "is invalid"
  end

  test "email must be unique" do
    Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "unique_owner@example.com",
      phone: "987654321"
    )

    owner = valid_owner
    owner.email = "unique_owner@example.com"

    assert_not owner.valid?
    assert_includes owner.errors[:email], "has already been taken"
  end

  test "phone is required" do
    owner = valid_owner
    owner.phone = nil

    assert_not owner.valid?
    assert_includes owner.errors[:phone], "can't be blank"
  end
end