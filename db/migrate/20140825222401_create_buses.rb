class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.integer :number
      t.belongs_to :line
    end
  end
end
