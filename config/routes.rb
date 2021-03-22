# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/search' => 'postcode#search', :as => 'search_page'
  get '/index' => 'postcode#index', :as => 'home_page'
  root 'postcode#index'
end
