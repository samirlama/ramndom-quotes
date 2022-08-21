class QuotesController < ApplicationController
  before_action :read_csv_file

  def index
    respond_to do |format|
      format.html { }
      format.json { render json: { data: @parsed_csv , success: true }, status: :ok}
    end
  end

  def quote
    random_quote = @parsed_csv.sample
    render json: { data: random_quote, success: true }, status: :ok
  end


  private

  def read_csv_file
    @parsed_csv = CsvParser.call(File.read(Rails.root.join('public', 'csv', 'quotes.csv'))).as_json
  end
end
