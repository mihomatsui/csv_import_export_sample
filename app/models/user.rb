class User < ApplicationRecord
  # 受け取るパラメータを指定
  CSV_COLUMNS = %w[name age height].freeze

  def self.import_csv(file:)
    # トランザクション(CSVインポートの途中でエラーが出た場合はロールバック)
    User.transaction do
      CSV.foreach(file.path, headers: true) do |row|
        # インポートするカラムを制限
        create!(row.to_h.slice(*CSV_COLUMNS))
      end
    end
  end
end
