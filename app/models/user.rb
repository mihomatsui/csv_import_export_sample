class User < ApplicationRecord
  require "csv"
  CSV_COLUMNS = %w[name age height].freeze

  def self.import_csv(file:)
    list = []
    CSV.foreach(file.path, headers: true) do |row|
      list << row.to_h.slice(*CSV_COLUMNS)
    end
    User.import!(list)
  end

  def self.generate_csv
    CSV.generate do |csv|
      csv << CSV_COLUMNS
      all.each do |user|
        csv << CSV_COLUMNS.map { |col| user.send(col) }
      end
    end
  end
end
