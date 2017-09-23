class AddUserAttributes < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :integer
    add_column :users, :height, :float
    add_column :users, :weight, :float
    add_column :users, :aim, :string
    add_column :users, :image, :string
  end
end
