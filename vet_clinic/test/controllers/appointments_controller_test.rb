require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get show" do
    owner = Owner.create!(
      first_name: "Test",
      last_name: "Owner",
      email: "appointment_owner_test@example.com",
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

    vet = Vet.create!(
      first_name: "Test",
      last_name: "Vet",
      email: "appointment_vet_test@example.com",
      phone: "123456789",
      specialization: "General Practice"
    )

    appointment = Appointment.create!(
      pet: pet,
      vet: vet,
      date: 1.day.ago,
      reason: "Checkup",
      status: :completed
    )

    get appointment_url(appointment)
    assert_response :success
  end
end