Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/create_invoice" => "application#invoice_form"
  post "/create_invoice" => "application#create_invoice"
  get "/invoice/:slug" => "application#invoice"
  
  root "application#index"
end
