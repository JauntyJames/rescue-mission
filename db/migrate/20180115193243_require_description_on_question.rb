class RequireDescriptionOnQuestion < ActiveRecord::Migration[5.1]
  def up
    change_column :questions, :description, :string, null: false
  end

  def down
    change_column :questions, :description, :string
  end
end
