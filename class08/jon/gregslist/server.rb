require 'sinatra'
require 'sinatra/reloader'
require 'pry'

list = []


get "/" do
	@list = list 
	erb :index
end

get "/new" do
	@list = list 
	erb :new
end

get "/deals" do
	@deals = list.select do |price|
  	price[:price].to_i < 20
  end
	erb :deals
end

get "/cities/:location" do
	@location = params[:location]
	erb :cities
end

post '/create' do
	item = params[:item]
	price = params[:price]
	location = params[:location]
  list.push({:item => item, :price => price, :location => location})
  redirect '/'
end

