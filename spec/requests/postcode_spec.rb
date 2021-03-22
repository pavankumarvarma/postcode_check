# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'postcode', type: :request do
  it 'GET index page' do
    get "/index"
    expect(response).to render_template(:index)
  end

  it 'GET Search results' do
    get "/search?search=SE1+7QD"
    expect(response).to render_template(:index)
    expect(response.body).to include("Service available for SE17QD")
  end
end
