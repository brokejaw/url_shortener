require 'rails_helper'

RSpec.describe ShortenedUrlsController, :type => :controller do

  describe 'GET #root' do
    it 'renders the submission form' do
      get :root
        expect(response).to render_template(:form)
    end
  end
end
