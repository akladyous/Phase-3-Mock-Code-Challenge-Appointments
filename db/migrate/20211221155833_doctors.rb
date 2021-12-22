class Doctors < ActiveRecord::Migration[6.1]
    def change
        create_table :doctors do |t|
            t.string :name
            t.string :location
        end
    end
end
