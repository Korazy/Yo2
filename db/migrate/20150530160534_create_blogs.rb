class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :uid
      t.text :msg

      t.timestamps
    end
  end
end
