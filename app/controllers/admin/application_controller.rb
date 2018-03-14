class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin/admin'.freeze
  
end
