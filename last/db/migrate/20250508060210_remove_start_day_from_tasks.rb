class RemoveStartDayFromTasks < ActiveRecord::Migration[6.1]
  def change
    if table_exists?(:tasks) && column_exists?(:tasks, :strat_day)
      remove_column :tasks, :strat_day, :date
    else
      say "Skipping removal: tasks table or strat_day column does not exist."
    end
  end
end
