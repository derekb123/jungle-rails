class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["USER_PASSWORD"]

  def show
  end
end
