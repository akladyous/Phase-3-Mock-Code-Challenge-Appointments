class Appointment < ActiveRecord::Base
    belongs_to :doctor, counter_cache: true
    belongs_to :patient

    def reminder 
        "Hello, #{self.patient.name}. You have an appointment on #{self.date} at #{self.time} with Dr. #{self.doctor.name}."
    end

    def senior_citizen
        self.patient.age > 65 ? true : false
    end
end