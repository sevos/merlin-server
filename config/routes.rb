MerlinServer::Application.routes.draw do
  get '/config/:environment.:format' => 'config#show'
end
