class AddScriptToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :script, :text
  end
end
