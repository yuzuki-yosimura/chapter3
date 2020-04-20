Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'bookers#top'
  get 'books' => 'bookers#books', as:'books'
  post 'books' => 'bookers#create'
  delete 'books/:id/delete' => 'bookers#destroy', as: 'destroy_bookers'
  get 'books/:id' => 'bookers#show', as: 'bookers'
  get 'books/:id/edit' => 'bookers#edit', as: 'edit_bookers'
  patch 'books/:id/edit' => 'bookers#update', as: 'update_bookers'
end
