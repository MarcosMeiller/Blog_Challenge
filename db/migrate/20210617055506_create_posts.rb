class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :content
      t.string :date_creation
      t.boolean :status, null: false ,default: true
      t.references :user, null: false ,foreing_key: true
      t.references :category, null: false, foreing_key: true
      t.timestamps
    end
  end
end
