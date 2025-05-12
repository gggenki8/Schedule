class Task < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 20 }
    validates :start_day, presence: true
    validates :end_day, presence: true
    validates :memo, length: { maximum: 500 }

    validate :end_day_after_start_day

    private
        def end_day_after_start_day
            return if start_day.nil? || end_day.nil?
            if start_day > end_day
                errors.add(:end_day, "は開始日より後の日付にしてください")
            end
        end
end
