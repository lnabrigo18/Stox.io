require 'rails_helper'

RSpec.describe 'Stocks', type: :request do
  describe 'GET update_stock' do
    it 'returns a redirect response to update stock' do
      get update_stock_path
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #show' do
    before { get '/stocks/:id' }

    it 'is a success to display show page' do
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #search' do
    before { get search_stock_path }

    it 'is a success to search stock real-time and display' do
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #index' do
    before { get stocks_path }

    it 'is a success to display index page' do
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #update_stock' do
    before { get update_stock_path }

    it 'is a success to update stock from api' do
      expect(response).to have_http_status(:found)
    end

    it 'is a success to redirect specified path' do
      expect(response).to redirect_to('/dashboard')
    end
  end

  describe 'POST #transaction_buy' do
    before { post transaction_buy_path }

    it 'is a success to buy stock and display transaction' do
      expect(response).to have_http_status(:found)
    end

    it 'is a success to redirect desired path' do
      expect(response).to redirect_to('/dashboard')
    end
  end

  describe 'POST #transaction_sell' do
    before { post transaction_sell_path }

    it 'is a successto sell stock and display transaction' do
      expect(response).to have_http_status(:found)
    end

    it 'is a success to redirect specific path' do
      expect(response).to redirect_to('/dashboard')
    end
  end
end
