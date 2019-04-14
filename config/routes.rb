Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post '/search_contacts' => 'home#search_contacts', :as => :search_contacts
  post '/add_contact' => 'home#add_contact', :as => :add_contact
  get '/google_sports' => 'home#google_sports', :as => :google_sports

end
