class Patient < ActiveRecord::Base
    has_many :appointments
    has_many :doctors, through: :appointments


    scope :senior, ->{ where(age: 65..) }
    scope :by_location, -> (location) { where(location: location) }
    
    def reminders
        self.appointments.collect{|appt| appt.reminder}
    end

    def introduction
        "Hello my name is #{self.name}, I am #{self.age} years old and I live in #{location}."
    end

    def self.most_appointments
        self.all.sort{|a,b| a.appointments.count <=> b.appointments.count}.last
    end

    def self.senior_citizen_list(from_age)
        self.where(age: from_age..).pluck(:name)
    end
end
