class AddDescriptionToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :description, :string
  end
end
