require 'rails_helper'

RSpec.describe ShortenedUrlsController, :type => :controller do

  describe 'GET #root' do
    
    it 'has a 200 status code' do
      get :root
        expect(response.status).to eq(200)
    end
    
    it 'renders the submission form' do
      get :root
        expect(response).to render_template(:form)
    end
  end
  
  describe 'POST #create' do
    
    context "with valid attributes" do
      it "renders the show page" do
        post :create, shortened_url: FactoryGirl.attributes_for(:shortened_url)
        expect(response).to render_template(:show)
      end
    end
    
    context "with invalid attributes" do
      it "does not save the model" do
        expect{
          post :create, invalid_sub: FactoryGirl.create(:invalid_sub)
        }.to raise_error
      end
    end
  end  
end