# frozen_string_literal: true

require 'rails_helper'

describe Api::BoxesController, type: :request do
  let(:user) { create_user }

  let(:valid_attributes) do
    {
      name: 'kitchen',
      description: 'stuff for the kitchen',
      box_type: 'room'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      description: 'valid description',
      box_type: 0
    }
  end

  let(:valid_headers) do
    login_with_api(user)
    { Authorization: response.headers['Authorization'] }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Box.create! valid_attributes
      get api_boxes_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      box = Box.create! valid_attributes
      get api_box_url(box), headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Box' do
        expect do
          post api_boxes_url,
               params: { box: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Box, :count).by(1)
      end

      it 'renders a JSON response with the new box' do
        post api_boxes_url,
             params: { box: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Box' do
        expect do
          post api_boxes_url,
               params: { box: invalid_attributes }, as: :json
        end.to change(Box, :count).by(0)
      end

      it 'renders a JSON response with errors for the new box' do
        post api_boxes_url,
             params: { box: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'bathroom',
          description: 'stuff for bathroom',
          box_type: 'room'
        }
      end

      it 'updates the requested box' do
        box = Box.create! valid_attributes
        patch api_box_url(box),
              params: { box: new_attributes }, headers: valid_headers, as: :json
        box.reload

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['name']).to eq('bathroom')
      end

      it 'renders a JSON response with the box' do
        box = Box.create! valid_attributes
        patch api_box_url(box),
              params: { box: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the box' do
        box = Box.create! valid_attributes
        patch api_box_url(box),
              params: { box: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested box' do
      box = Box.create! valid_attributes
      expect do
        delete api_box_url(box), headers: valid_headers, as: :json
      end.to change(Box, :count).by(-1)
    end
  end
end
