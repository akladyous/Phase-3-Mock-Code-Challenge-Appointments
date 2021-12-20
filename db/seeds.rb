puts "Creating Doctors..."

5.times{Doctor.create(name: Faker::Name.name, location: Faker::Address.city)}

puts "Creating Patients..."

5.times{Patient.create(name: Faker::Name.name, location: Faker::Address.city, age: rand(1..100))}

puts "Creating Appointments..."

50.times{Appointment.create(doctor_id: rand(1..5), patient_id: rand(1..5), date: Faker::Date.between(from: '2021-11-01', to: '2021-12-23'), time: '2:00') }