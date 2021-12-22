class Appointment < ActiveRecord::Base
    belongs_to :doctor
    belongs_to :patient

    scope :dicembre, -> { where(date: "2021-12-08") }
    scope :by_time, -> (time_value) { where(time: time_value) }
    scope :by_date, -> (date_value) { where(date: date_value) }

    def reminder
        # self represents the instance of appointment that method was called on
        "Hello, #{self.patient.name}. You have an appointment on #{self.date} at #{self.time} with Dr. #{self.doctor.name}"
    end

    def senior_citizen
        self.patient.age > 65
    end

end