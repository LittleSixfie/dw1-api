Rails.application.routes.draw do
  root 'welcome#index' 
  get 'Service' => 'welcome#Service'
  get 'about_us' => 'welcome#about_us'
  get 'article' => 'welcome#article'
  get 'blog' => 'welcome#blog'
  get 'contact' => 'welcome#contact'
  get 'footer' => 'welcome#footer'
  get 'header' => 'welcome#header'
  get 'login' => 'welcome#login'
  get 'Presupuesto' => 'welcome#Presupuesto'
  get 'Services' => 'welcome#Services'
  get 'HRM' => 'welcome#HRM'

  get 'js/particles.min.js' => 'welcome#particles.min.js'

  get 'services/getall' => 'services#getall'
  get 'services/getalljson' => 'services#getalljson' 
  get 'services/getter/:id' => 'services#getter'
  get 'services/creator' => 'services#creator'
  get 'services/updator/:id' => 'services#updator'
  post 'services/trueupdate/:id', to: 'services#trueupdate'
  post 'services/insertService' => 'services#insertService'
  post 'services/remove/:id', to: 'services#remove'



  get 'articles/show' => 'articles#show'
  get 'articles/index' => 'articles#index'
  get 'articles/leer/:id', to: 'articles#leer'
  get 'articles/crear' => 'articles#crear'
  post 'articles/insertar' => 'articles#insertar'
  get 'articles/actualizar/:id', to: 'articles#actualizar'
  post 'articles/editar/:id', to: 'articles#editar'
  post 'articles/eliminar/:id', to: 'articles#eliminar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
