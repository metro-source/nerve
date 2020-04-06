Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/create_invoice" => "invoice#invoice_form"
  post "/create_invoice" => "invoice#create_invoice"
  get "/invoice/:slug" => "invoice#invoice"
  
  post "/signin" => "signin#signin"
  get "/signin" => "signin#show"
  
  root "invoice#index"
end
