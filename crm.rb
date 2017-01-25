# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require 'sinatra'
require_relative 'contact'
use Rack::MethodOverride

# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')

get '/' do
  @crm_app_name = "Yuri's CRM"
  erb :index
end

get '/contacts' do
 erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/delete' do
  erb :delete
end

post '/contacts/delete' do
  # raise params.inspect
  Contact.find(params[:id].to_i).delete

  redirect to('/contacts')
end

get '/contacts/1900' do
  @contact = Contact.find(1900)
  erb :show_contact
end
