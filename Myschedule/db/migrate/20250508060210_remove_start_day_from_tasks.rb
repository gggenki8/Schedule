class RemoveStartDayFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :strat_day, :date
  end
end
