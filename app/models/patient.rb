class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :doctors, through: :appointments

    def reminders
        self.appointments.map{|appt| appt.reminder}
    end

    def introduction
        "Hello my name is #{self.name}, I am #{self.age} years old and I live in #{self.location}."
    end

    def self.most_appointments
        self.all.sort{|a, b| b.appointments.count <=> a.appointments.count}.first
        #Patient.joins(:appointments => :doctor).select('patients.*, COUNT(appointments.id) AS appointment_count').group('patient_id').order('COUNT(appointments.id) ASC').limit(1)
    end
end