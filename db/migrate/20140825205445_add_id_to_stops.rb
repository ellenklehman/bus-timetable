class AddIdToStops < ActiveRecord::Migration
  def change
    add_column :stops, :id, :primary_key
  end
end
