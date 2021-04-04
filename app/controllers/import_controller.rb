class ImportController < ApplicationController
  def create
    # CSVファイルを選択しているときだけインポートを行うように修正
    User.import_csv(file: params[:file]) if params[:file].present?
    redirect_to users_path
  end
end
