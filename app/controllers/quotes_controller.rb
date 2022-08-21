class QuotesController < ApplicationController
  def index; end

  def quote
    @random_quote = CsvParser.call(File.read(Rails.root.join('public', 'csv', 'quotes.csv'))).sample

    respond_to do |format|
      format.html {}
      format.json { render json: { data: @random_quote, success: true }, status: :ok }
      format.xml { render xml: @random_quote }
    end
  end
end
