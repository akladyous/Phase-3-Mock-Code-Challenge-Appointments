class Appointments < ActiveRecord::Migration[6.1]
    def change
        create_table :appointments do |t|
            t.string :date
            t.string :time
            t.references :doctor, foreign_key: true
            t.references :patient, foreign_key: true
        end
    end
end
