class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_book, except: [:top, :about]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name, :email]
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def set_book
    @new_book = Book.new
  end
end
