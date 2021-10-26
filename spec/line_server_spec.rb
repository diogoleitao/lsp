# frozen_string_literal: true

describe 'Line Server', type: :request do
  def app
    LineServer
  end

  ClimateControl.modify(FILE: 'spec/fixtures/lorem.txt') do
    describe 'GET /lines/:index' do
      context 'when index is less than total lines' do
        it 'returns line and 200 code' do
          get '/lines/1'

          expect(last_response.status).to be 200
        end
      end

      context 'when index is greater than total lines' do
        it 'returns 413' do
          get '/lines/1'

          expect(last_response.status).to be 413
        end
      end
    end
  end
end
