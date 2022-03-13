class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    Message.all.to_json
  end

  patch '/messages/:id' do
    m=Message.find(params[:id])
    # binding.pry
    m.update(
      body: params[:body]
    )
    m.to_json
  end

  post '/messages' do
    m=Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at]

    )
    m.to_json
  end

  delete '/messages/:id' do
    Message.find(params[:id]).destroy
  end

  
end
