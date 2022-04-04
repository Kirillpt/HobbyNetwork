class AddCategoryFields < ActiveRecord::Migration[7.0]
  def change
    change_table :categories do |t|
      t.integer  :subs, default: 0
      t.string   :title, null: false
      t.string   :slug, null: false
    end
  end
end
