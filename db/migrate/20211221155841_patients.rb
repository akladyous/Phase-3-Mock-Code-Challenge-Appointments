class Patients < ActiveRecord::Migration[6.1]
    def change
        create_table :patients do |t|
            t.string :name
            t.string :location
            t.integer :age
        end
    end
end
