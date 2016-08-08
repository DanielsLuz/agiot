class ApplicationController < ActionController::Base
  before_action :mocks_user, only: [:index, :create]

  protect_from_forgery with: :exception

  def index
    render 'layouts/application'
  end

  private

  def mocks_user
    @current_user = User.first
  end
end
