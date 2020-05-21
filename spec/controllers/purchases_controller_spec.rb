require 'rails_helper'

describe PurchasesController do
  describe 'GET #index' do
    it "index.html.hamlに移行すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #cache' do
    it "cache.html.hamlに移行すること" do
      get  :cache
      expect(response).to render_template :cache
    end
  end

end
