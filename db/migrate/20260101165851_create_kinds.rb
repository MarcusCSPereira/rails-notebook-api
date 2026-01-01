class CreateKinds < ActiveRecord::Migration[8.1]
  def change
    create_table :kinds do |t|
      t.text :description

      t.timestamps
    end
  end
end
