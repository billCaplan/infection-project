Rails.application.routes.draw do

root 'static_pages#root'

resources :users
resources :courses
resources :enrollments
end
