class Doctor < ActiveRecord::Base
    has_many :appointments
    has_many :patients, through: :appointments

    def patient_list
        # self.patients.map{|patient| patient.name}.uniq
        self.patients.pluck(:name).uniq
    end

    def schedule_appointment(patient, date, time)
        Appointment.create(doctor: self, patient: patient, date: date, time: time)
        # "hello world"
    end

    def self.least_patients
        self.all.sort{|a,b| a.patients.count <=> b.patients.count}.first
        # self.joins(:appointments => :patient).select('doctors.*, COUNT(appointments.id) AS appointment_count').group('doctor_id').order('COUNT(appointments.id) ASC').limit(1)
    end

    def quit_job
        # method should delete all appointments associated with instance of doctor
    end

    def test
        Doctor.find_each do |d|
            puts d
        end
    end
end



