require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  def valid_owner
    Owner.create!(
      first_name: "Treatment",
      last_name: "Owner",
      email: "treatment_owner_model_test@example.com",
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
      first_name: "Treatment",
      last_name: "Vet",
      email: "treatment_vet_model_test@example.com",
      phone: "111111111",
      specialization: "General Practice"
    )
  end

  def valid_appointment
    Appointment.create!(
      pet: valid_pet,
      vet: valid_vet,
      date: Time.current,
      reason: "Checkup",
      status: :scheduled
    )
  end

  def valid_treatment
    Treatment.new(
      appointment: valid_appointment,
      name: "Vaccine",
      medication: "Rabies Vaccine",
      dosage: "1 dose",
      notes: "No issues",
      administered_at: Time.current
    )
  end

  test "valid treatment can be saved" do
    treatment = valid_treatment

    assert treatment.save
  end

  test "name is required" do
    treatment = valid_treatment
    treatment.name = nil

    assert_not treatment.valid?
    assert_includes treatment.errors[:name], "can't be blank"
  end

  test "administered_at is required" do
    treatment = valid_treatment
    treatment.administered_at = nil

    assert_not treatment.valid?
    assert_includes treatment.errors[:administered_at], "can't be blank"
  end

  test "appointment is required" do
    treatment = valid_treatment
    treatment.appointment = nil

    assert_not treatment.valid?
    assert_includes treatment.errors[:appointment], "must exist"
  end
end