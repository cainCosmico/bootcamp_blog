require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  login_user

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
    before do
      article = create :article
      p article.save
      get :show, params: { id: 1 }
    end
    
    it 'return a success response' do
      expect(response).to be_successful
    end

    it "return a success template" do
      expect(response).to render_template("show")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it 'redirects to show page' do
        post :create, params: { article: {
                                  title: 'Test post', 
                                  body: 'Some body with at leats 10 chars',
                                  status: 'public' }
                              }
      
        expect(response.content_type).to eq "text/html; charset=utf-8"
        expect(response).to redirect_to(assigns(:article))
      end
    end

    context "with invalid params" do
      it "re-renders #new form" do
        post :create, params: { article: {
                                  title: 'Test post', 
                                  body: 'Some body with at leats 10 chars',
                                  status: 'non' }
                              }
        expect(response).to render_template("articles/new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let (:new_attr) do
        {
          id: 1,
          title: 'Test',
          body: 'Some body with at leats 10 chars',
          status: 'public',
          user: 1
        }
      end

      it "update the requested article" do
        article = create :article        
        patch :update, params: { id: article.id, article: new_attr }
        expect(response).to redirect_to(assigns(:article))
      end      
    end

    context 'with invalid parameters' do
      let (:invalid_attributes) do
        {
          id: 1,
          title: 'Test',
          body: 'body',
          status: 'non',
          user: 2
        }
      end

      it "renders a successful response" do
        article = create :article
        patch :update, params: { id: article.id, article: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested post' do
      article = create :article      
      article.save
      delete :destroy, params: { id: article.id }
      expect(response).to redirect_to(root_url)
    end
  end
end
