class User < ApplicationRecord
  # 受け取るパラメータを指定
  CSV_COLUMNS = %w[name age height].freeze

  def self.import_csv(file:)
    list = []
    CSV.foreach(file.path, headers: true) do |row|
      list << row.to_h.slice(*CSV_COLUMNS)
    end
    User.import!(list)
  end
end
