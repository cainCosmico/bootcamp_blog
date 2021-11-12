require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  login_user

  let(:valid_attributes) {
    { :title => "Test title!", 
      :body => "This is a test description", 
      :status => "public", user_id: 1 }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do      
      get :index, session: valid_session
      expect(response).to be_successful      
    end

    it "return a success template" do      
      get :index
      expect(response).to render_template("index")
    end    
  end

  describe "GET #show" do
  #   it 'return a success template' do
  #     get :show
  #     expect(response).to be_successful
  #     expect(response.body).to include('Test article')
  #   end
  #   # it "return a success template" do
  #   #   get :show
  #   #   expect(response).to render_template("show")
  #   # end
  end

  describe "POST #create" do
    it "redirects to show page" do
      post create :article#, article: FactoryBot.attributes_for(:article)
      expect(response).to redirect_to(root_url)
    end
  #   context "with valid params" do
  #     it 'redirects to show page' do

  #     end
  #   end

  #   context "with invalid params" do
  #     it "re-renders #new form" do

  #     end
  #   end
  end

  describe "PUT #update" do

  end

  describe "DELETE #destroy" do
  #   before { get :index }
  #   it { should render_template('index') }
  end
end