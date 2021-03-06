class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :username
      t.string :email
      t.string :image_url
      t.string :token

      t.timestamps
    end
  end
end
