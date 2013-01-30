class RegistrationsController < Devise::RegistrationsController
  #
  # POST /resource
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      redirect_to root_url, flash: { error: "Could not register, please check your details"}
    end
  end


  protected
  def after_inactive_sign_up_path_for(resource)
    # the page new users will see after sign up (after launch, when no invitation is needed)
    signup_confirmation_path
  end

  def after_sign_up_path_for(resource)
    # the page new users will see after sign up (after launch, when no invitation is needed)
    signup_confirmation_path
  end

end
