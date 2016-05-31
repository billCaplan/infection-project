Rails.application.routes.draw do
  root 'static_pages#root'

  resources :users
  resource :users do
    member do
      patch :change_version
    end
  end
  resources :courses
  resources :enrollments
    resource :static_pages do
      member do
       post :change_amount
     end
    end
end
