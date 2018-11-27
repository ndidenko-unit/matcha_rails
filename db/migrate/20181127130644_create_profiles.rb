class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string  :first_name, default: ""
      t.string  :last_name, default: ""
      t.integer :age, default: nil
      t.string  :gender, default: ""
      t.string  :sex_preferences, default: ""
      t.text    :bio, default: ""
      t.string  :tags, array: true, default: [].to_yaml
      t.float   :rating, default: 0
      t.integer  :user_id, null: false, unique: true
      t.timestamps
    end
  end
end
