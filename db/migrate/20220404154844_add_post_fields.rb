class AddPostFields < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.string  :title, null: false
      t.text    :body,  null: false
      t.integer :likes, default: 0
      t.string  :slug,  null: false, index: true

      t.belongs_to :user
      t.belongs_to :category

    end
  end
end
