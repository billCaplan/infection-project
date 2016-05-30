Rails.application.routes.draw do
  root 'static_pages#root'

  resources :users
  resources :courses
  resources :enrollments
    resource :static_pages do
      member do
       post :change_amount
     end
    end
end
