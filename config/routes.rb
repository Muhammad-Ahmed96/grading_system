Rails.application.routes.draw do
  resources :users, except: [:destroy, :sign_in, :show]
  delete 'delete_user/:id', to: 'users#delete_user', as: 'delete_user'
  get 'show_user/:id', to: 'users#show_user', as: 'show_user'
  devise_for :users
  resources :assessments
  resources :courses
  root 'home#welcome'
  get '/welcome', to: 'home#welcome'
  get '/main_page', to: 'home#main_page', as: 'main_page'
  get 'add_assessment/:id', to: 'courses#add_assessment', as: 'add_assessment'
  get 'view_students/:id', to: 'courses#enrolled_students', as: 'enrolled_students'
  get 'new_student/:id', to: 'courses#new_student', as: 'new_student'
  get 'add_student/:id', to: 'courses#add_student', as: 'add_student'
  get 'remove_student/:id', to: 'courses#remove_student', as: 'remove_student'
  get 'view_grades/:id', to: 'users#view_grades', as: 'view_grades'
  post 'save_grades', to: 'users#save_grades', as: 'save_grades'
  get 'view_grades_details/:id', to: 'users#view_grades_details', as: 'view_grades_details'
  get 'view_course_details/:id', to: 'courses#view_course_details', as: 'view_course_details'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
