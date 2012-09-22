class CreateEcmSlidersSliders < ActiveRecord::Migration
  def change
    create_table :ecm_sliders_sliders do |t|
      t.string :name
      t.text :description

      # friendly id
      t.string :slug

      # associations
      t.integer :ecm_sliders_items_count, :default => 0, :null => false

      t.timestamps
    end
  end
end
