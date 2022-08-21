require 'csv'

class CsvParser
  attr_reader :csv_file

  def initialize(file)
    @csv_file = file
  end

  def self.call(file)
    new(file).process
  end

  def process
    headers_converters = lambda { |h| h.downcase }
    hash_data = Array.new
    CSV.parse(csv_file, headers: true, header_converters: headers_converters) do |row|
      title = row['title']
      author = row['author']
      hash_data << { title: title, author: author }
    end

    hash_data.as_json
  end
end
