class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
    # ------------
    create_table :tiny_images do |t|
      t.string :file
      t.string :alt

      t.timestamps
    end

    create_table :parts do |t|
      t.references :page, null: false, foreign_key: true
      t.string :name
      t.text :content
      
      t.timestamps
    end
  end
end
