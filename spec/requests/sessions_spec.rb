require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET #new' do
    before { get login_path }

    it 'is a success to create new user' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    before { post login_path }

    it 'is a success to post create for new user' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #index' do
    before { get dashboard_path }

    it 'is a success to show index page' do
      expect(response).to have_http_status(:found)
    end

    it 'is a success to redirect after page display' do
      expect(response).to redirect_to('/dashboard')
    end
  end

  describe 'GET dashboard for admin' do
    before { get dashboard_admin_path }

    it 'is a success for display' do
      expect(response).to have_http_status(:found)
    end

    it 'is a success to redirect after show page' do
      expect(response).to redirect_to('/dashboard')
    end
  end

  describe 'GET #welcome' do
    before { get welcome_path }

    it 'is a success to display page' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #out' do
    before { get dashboard_admin_path }

    it 'is a success to logout' do
      expect(response).to have_http_status(:found)
    end

    it 'is a success redirect main path' do
      expect(response).to redirect_to('/dashboard')
    end
  end

  describe 'GET #approve' do
    before { get approve_path }

    it 'is a success to approve broker' do
      expect(response).to have_http_status(:found)
    end

    it 'is a success to redirect dashboard' do
      expect(response).to redirect_to('/dashboard')
    end
  end
end
