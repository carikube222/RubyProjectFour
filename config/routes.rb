Rails.application.routes.draw do
    get 'pantrys/index' => 'pantrys#index'
    resources :pantrys
    get 'wines/index' => 'wines#index'
    resources :wines

    get '/' => 'users#index'
    post '/create' => 'users#create'
    post '/login' => 'users#login'
    get '/show' => 'users#show'
    get '/info/:id' =>'users#info'
    get '/edit/:id' =>'users#edit'
    post '/update/:id'=> 'users#update'
    get '/logout' => 'users#logout'

    get '/conditions/all' => 'conditions#index'
    get '/conditions/show/:id' => 'conditions#show'
    post '/conditions/yes/:id' => 'conditions#yes'
    post '/conditions/yes/yes/:id' => 'conditions#yes_show'
    post '/conditions/maybe/:id' => 'conditions#maybe'
    post '/conditions/maybe/maybe/:id' => 'conditions#maybe_show'
    post '/conditions/no/:id' => 'conditions#no'
    post '/conditions/no/no/:id' => 'conditions#no_show'
    post '/conditions/create' => 'conditions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
