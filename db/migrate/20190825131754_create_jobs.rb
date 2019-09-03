class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :summary
      t.string :category
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
