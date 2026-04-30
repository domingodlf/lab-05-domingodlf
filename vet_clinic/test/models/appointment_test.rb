require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def valid_owner
    Owner.create!(
      first_name: "Appointment",
      last_name: "Owner",
      email: "appointment_owner_model_test@example.com",
      phone: "123456789",
      address: "Santiago"
    )
  end

  def valid_pet
    Pet.create!(
      name: "Firulais",
      species: "dog",
      breed: "Labrador",
      date_of_birth: Date.new(2020, 5, 10),
      weight: 25.5,
      owner: valid_owner
    )
  end

  def valid_vet
    Vet.create!(
      first_name: "Appointment",
      last_name: "Vet",
      email: "appointment_vet_model_test@example.com",
      phone: "111111111",
      specialization: "General Practice"
    )
  end

  def valid_appointment
    Appointment.new(
      pet: valid_pet,
      vet: valid_vet,
      date: Time.current,
      reason: "Checkup",
      status: :scheduled
    )
  end

  test "valid appointment can be saved" do
    appointment = valid_appointment

    assert appointment.save
  end

  test "date is required" do
    appointment = valid_appointment
    appointment.date = nil

    assert_not appointment.valid?
    assert_includes appointment.errors[:date], "can't be blank"
  end

  test "reason is required" do
    appointment = valid_appointment
    appointment.reason = nil

    assert_not appointment.valid?
    assert_includes appointment.errors[:reason], "can't be blank"
  end

  test "pet is required" do
    appointment = valid_appointment
    appointment.pet = nil

    assert_not appointment.valid?
    assert_includes appointment.errors[:pet], "must exist"
  end

  test "vet is required" do
    appointment = valid_appointment
    appointment.vet = nil

    assert_not appointment.valid?
    assert_includes appointment.errors[:vet], "must exist"
  end

  test "status is required" do
    appointment = valid_appointment
    appointment.status = nil

    assert_not appointment.valid?
    assert_includes appointment.errors[:status], "can't be blank"
  end
end