class Doctor < ActiveRecord::Base
    has_many :appointments
    has_many :patients, through: :appointments

    def patient_list
        self.patients.map{|patient| patient.name}
    end

    def schedule_appointment(patient, date, time)
        Appointment.create(doctor_id: self.id, patient_id: patient.id, date: date, time: time)
    end

    def patient_count 
        self.patients.count
    end

    def self.least_patients
        #self.joins(:appointments => :patient).select('doctors.*, COUNT(appointments.id) AS appointment_count').group('doctor_id').order('COUNT(appointments.id) DESC').limit(1)
        self.all.sort{|a, b| a.patient_count <=> b.patient_count}.first
    end
end