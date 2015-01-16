class RegistrationsController < Devise::RegistrationsController
  after_filter :setup_spree_session_var

  protected

  def setup_spree_sessions_var
    if resource.persisted?
      session[:spree_user_signup] = true
    end
  end
end
