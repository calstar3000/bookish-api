class ChangeAuthorFromTextToStringInBooks < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :author, :string
  end

  def down
    change_column :books, :author, :text
  end
end
