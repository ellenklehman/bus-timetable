class CreateTables < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
    end

    create_table :lines do |t|
      t.string :name
    end

    create_join_table :stations, :lines, table_name: :stops
  end
end
