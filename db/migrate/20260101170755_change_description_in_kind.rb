class ChangeDescriptionInKind < ActiveRecord::Migration[8.1]
  def change
    change_column :kinds, :description, :string
  end
end
