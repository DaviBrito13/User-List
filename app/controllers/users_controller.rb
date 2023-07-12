class UsersController < ApplicationController
  #Classe necessária para fazer requisições http
  require 'net/http'
  #Classe necessária para manipular JSON
  require 'json'
  #Classe para fazer a paginação
  require 'will_paginate/array'

  def index
    url = URI("https://run.mocky.io/v3/ce47ee53-6531-4821-a6f6-71a188eaaee0")
    #Create an instance from Net::HTTP class
    http = Net::HTTP.new(url.host, url.port)
    #Set a encrypted connection with the api
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    users = JSON.parse(response.body)
    @users = users['users'].paginate(page: params[:page], per_page: 10)
  end

end