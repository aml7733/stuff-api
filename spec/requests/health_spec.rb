require 'rails_helper'

RSpec.describe "Healths", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/health/index"

      json = JSON.parse(response.body).deep_symbolize_keys

      expect(json).to eq({ status: 'online' })
      expect(response).to have_http_status(:success)
    end
  end

end
