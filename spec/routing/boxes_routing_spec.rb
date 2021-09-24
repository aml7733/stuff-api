# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::BoxesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/boxes').to route_to('api/boxes#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/boxes/1').to route_to('api/boxes#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/boxes').to route_to('api/boxes#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/boxes/1').to route_to('api/boxes#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/boxes/1').to route_to('api/boxes#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/boxes/1').to route_to('api/boxes#destroy', id: '1', format: :json)
    end
  end
end
