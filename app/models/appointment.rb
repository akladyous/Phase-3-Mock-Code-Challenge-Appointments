class Appointment < ActiveRecord::Base
    belongs_to :doctor
    belongs_to :patient

    def reminder
        # self represents the instance of appointment that method was called on
        "Hello, #{self.patient.name}. You have an appointment on #{self.date} at #{self.time} with Dr. #{self.doctor.name}"
    end

    def senior_citizen
        self.patient.age > 65
    end
end