class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string   :name
      t.text     :address
      t.string   :city
      t.integer  :user_id
    end

    add_column :businesses, :created_at, :timestamptz
    add_column :businesses, :updated_at, :timestamptz

    add_index :businesses, :user_id
  end
end
