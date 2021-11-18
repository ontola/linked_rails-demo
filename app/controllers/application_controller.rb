class ApplicationController < ActionController::API
  include LinkedRails::Controller
  include LinkedRails::Auth::AuthHelper
end
