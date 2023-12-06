class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :author
      t.string :email

      t.timestamps
    end
  end
end
