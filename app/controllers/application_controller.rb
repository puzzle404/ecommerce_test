class ApplicationController < ActionController::Base
  before_action :set_cart
  before_action :store_user_location!, if: :storable_location?

  # Sobrescribe la redirección después del inicio de sesión
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  private
  
  # Almacenar la ubicación para redirigir después del inicio de sesión
  def store_user_location!
    # Almacenar solo para las solicitudes HTML
    store_location_for(:user, request.fullpath)
  end

  # Verifica si la solicitud debe ser almacenada
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def set_cart
    @cart = Cart.new(session)
  end
end
