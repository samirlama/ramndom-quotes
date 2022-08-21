require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  render_views

  describe "GET /quote" do

    context "when html body is requested" do
      it "renders web page" do
        get :quote

        expect(response.body).to match(/Thought of the day/)
        expect(response.status).to be 200
      end
    end

    context "when json format is requested" do
      it "randomly provides a row from csv" do
        get :quote, as: :json

        response_body = JSON.parse(response.body).deep_symbolize_keys
        required_keys = %i[title author]

        expect(response_body[:data].keys).to eq(required_keys)
        expect(response.status).to be 200
      end
    end


    context "when xml format is requested" do
      it "randomly provides a xml format value from csv" do
        get :quote, as: :xml

        parsed_xml = Nokogiri::XML::Document.parse(response.body)
        required_keys = %w[title author]
        nodes = parsed_xml.elements.map do |ele|
                  ele.elements.map do |nested_ele|
                    nested_ele.name
                  end
        end.flatten

        expect(nodes).to eq(required_keys)
        expect(response.status).to be 200
      end
    end
  end
end
