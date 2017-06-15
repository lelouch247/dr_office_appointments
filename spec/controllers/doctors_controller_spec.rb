require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  login_user
  let(:doctor) { FactoryGirl.create(:doctor, user_id: @user.id) }

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets doctors instance variable' do
      get :index
      expect(assigns(:doctors).length).to eq(0)
    end


    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'sets the correct doctors in the doctors instance variable' do
      get :index
      expect(assigns(:doctors).length).to eq(1)
      expect(assigns(:doctors).first).to eq(doctor)
    end


  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: doctor.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show, params: { id: doctor.id }
      expect(response).to render_template(:show)
    end

    it 'sets the instance variable' do
      get :show, params: { id: doctor.id }
      expect(assigns(:doctor)).to eq(doctor)
    end


  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'sets the doctor instance variable' do
      get :new
      expect(assigns(:doctor)).to be_a_new(Doctor)
    end

    it 'renders a new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do

    it 'returns http redirect' do
      post :create, params: { doctor: FactoryGirl.attributes_for(:doctor, user_id: @user.id) }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
