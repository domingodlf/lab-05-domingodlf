# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end




### OWNERS

owner1 = Owner.create(
  first_name: "Domingo",
  last_name: "De la Fuente",
  email: "domingo@mail.com",
  phone: "123456789",
  address: "Lo Barnechea"
)

owner2 = Owner.create(
  first_name: "Juan",
  last_name: "Perez",
  email: "juan@mail.com",
  phone: "987654321",
  address: "Santiago"
)

owner3 = Owner.create(
  first_name: "Maria",
  last_name: "Gonzalez",
  email: "maria@mail.com",
  phone: "555555555",
  address: "Providencia"
)


### PETS

pet1 = Pet.create(
  name: "Firulais",
  species: "dog",
  breed: "Labrador",
  date_of_birth: "2020-05-10",
  weight: 25.5,
  owner: owner1
)

pet2 = Pet.create(
  name: "Michi",
  species: "cat",
  breed: "Siames",
  date_of_birth: "2021-03-15",
  weight: 4.2,
  owner: owner1
)

pet3 = Pet.create(
  name: "Rocky",
  species: "dog",
  breed: "Bulldog",
  date_of_birth: "2019-07-20",
  weight: 18.0,
  owner: owner2
)

pet4 = Pet.create(
  name: "Luna",
  species: "cat",
  breed: "Persa",
  date_of_birth: "2022-01-10",
  weight: 3.8,
  owner: owner3
)

pet5 = Pet.create(
  name: "Bunny",
  species: "rabbit",
  breed: "Mini Lop",
  date_of_birth: "2021-11-05",
  weight: 2.1,
  owner: owner3
)

pet6 = Pet.create(
  name: "Max",
  species: "dog",
  breed: "Golden Retriever",
  date_of_birth: "2022-06-15",
  weight: 28.0,
  owner: owner1
)

pet7 = Pet.create(
  name: "Nala",
  species: "cat",
  breed: "Maine Coon",
  date_of_birth: "2023-02-20",
  weight: 5.5,
  owner: owner2
)

pet8 = Pet.create(
  name: "Toby",
  species: "dog",
  breed: "Poodle",
  date_of_birth: "2021-09-10",
  weight: 7.0,
  owner: owner3
)


### VETS

vet1 = Vet.create(
  first_name: "Carlos",
  last_name: "Lopez",
  email: "carlos@vet.com",
  phone: "111111111",
  specialization: "General Practice"
)

vet2 = Vet.create(
  first_name: "Ana",
  last_name: "Martinez",
  email: "ana@vet.com",
  phone: "222222222",
  specialization: "Surgery"
)

vet3 = Vet.create(
  first_name: "Pedro",
  last_name: "Sanchez",
  email: "pedro@vet.com",
  phone: "333333333",
  specialization: "Dermatology"
)


### APPOINTMENTS

appointment1 = Appointment.create(
  pet: pet1,
  vet: vet1,
  date: Time.new(2026, 3, 25),
  reason: "Checkup",
  status: 0
)

appointment2 = Appointment.create(
  pet: pet2,
  vet: vet2,
  date: Time.new(2025, 11, 3),
  reason: "Vaccination",
  status: 1
)

appointment3 = Appointment.create(
  pet: pet3,
  vet: vet1,
  date: Time.new(2026, 1, 22),
  reason: "Injury",
  status: 2
)

appointment4 = Appointment.create(
  pet: pet4,
  vet: vet2,
  date: Time.new(2025, 12, 1),
  reason: "Skin issue",
  status: 3
)

appointment5 = Appointment.create(
  pet: pet5,
  vet: vet1,
  date: Time.new(2026, 4, 10),
  reason: "Routine check",
  status: 2
)

appointment6 = Appointment.create(
  pet: pet6,
  vet: vet3,
  date: Time.new(2025, 10, 14),
  reason: "Allergy",
  status: 0
)

appointment7 = Appointment.create(
  pet: pet7,
  vet: vet3,
  date: Time.new(2025, 11, 28),
  reason: "Checkup",
  status: 1
)

appointment8 = Appointment.create(
  pet: pet6,
  vet: vet3,
  date: Time.new(2025, 12, 16),
  reason: "Skin irritation",
  status: 2
)

appointment9 = Appointment.create(
  pet: pet1,
  vet: vet2,
  date: Time.new(2026, 1, 9),
  reason: "Follow-up",
  status: 0
)

appointment10 = Appointment.create(
  pet: pet2,
  vet: vet1,
  date: Time.new(2026, 2, 21),
  reason: "Dental cleaning",
  status: 1
)

appointment11 = Appointment.create(
  pet: pet7,
  vet: vet2,
  date: Time.new(2026, 3, 13),
  reason: "Vaccination",
  status: 2
)

appointment12 = Appointment.create(
  pet: pet6,
  vet: vet1,
  date: Time.new(2026, 4, 7),
  reason: "Routine check",
  status: 3
)


### TREATMENTS

Treatment.create(
  appointment: appointment2,
  name: "Vaccine",
  medication: "Rabies Vaccine",
  dosage: "1 dose",
  notes: "No issues",
  administered_at: appointment2.date + 1.day
)

Treatment.create(
  appointment: appointment3,
  name: "Bandage",
  medication: "Antibiotic cream",
  dosage: "Twice daily",
  notes: "Recovering well",
  administered_at: appointment3.date + 3.hours
)

Treatment.create(
  appointment: appointment3,
  name: "Pain relief",
  medication: "Ibuprofen",
  dosage: "Once daily",
  notes: "Monitor closely",
  administered_at: appointment3.date + 1.day + 2.hours
)

Treatment.create(
  appointment: appointment5,
  name: "General check",
  medication: "None",
  dosage: "N/A",
  notes: "Healthy",
  administered_at: appointment5.date + 4.hours
)

Treatment.create(
  appointment: appointment2,
  name: "Deworming",
  medication: "Antiparasitic",
  dosage: "Single dose",
  notes: "Follow-up in 3 months",
  administered_at: appointment2.date + 2.hours
)

Treatment.create(
  appointment: appointment6,
  name: "Antihistamine",
  medication: "Loratadine",
  dosage: "Once daily",
  notes: "Monitor response",
  administered_at: appointment6.date + 2.hours
)

Treatment.create(
  appointment: appointment7,
  name: "General check",
  medication: "None",
  dosage: "N/A",
  notes: "Healthy",
  administered_at: appointment7.date + 1.day + 3.hours
)

Treatment.create(
  appointment: appointment8,
  name: "Skin cream",
  medication: "Hydrocortisone",
  dosage: "Twice daily",
  notes: "Apply for 1 week",
  administered_at: appointment8.date + 5.hours
)

Treatment.create(
  appointment: appointment9,
  name: "Follow-up exam",
  medication: "None",
  dosage: "N/A",
  notes: "Stable condition",
  administered_at: appointment9.date + 2.days
)

Treatment.create(
  appointment: appointment10,
  name: "Cleaning",
  medication: "Dental solution",
  dosage: "Single session",
  notes: "Teeth cleaned",
  administered_at: appointment10.date + 4.hours
)

Treatment.create(
  appointment: appointment11,
  name: "Vaccine",
  medication: "Feline vaccine",
  dosage: "1 dose",
  notes: "No reaction",
  administered_at: appointment11.date + 1.day
)

Treatment.create(
  appointment: appointment12,
  name: "Routine check",
  medication: "None",
  dosage: "N/A",
  notes: "All good",
  administered_at: appointment12.date + 3.hours
)