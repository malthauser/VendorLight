class Accounts::RegistrationsController < Devise::RegistrationsController
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    if resource.update_with_password(params[resource_name])
      if is_navigational_format?
        if resource.respond_to?(:pending_reconfirmation?) && resource.pending_reconfirmation?
          flash_key = :update_needs_confirmation
        end
        set_flash_message :notice, flash_key || :updated
      end
      sign_in resource_name, resource, :bypass => true
      if params[:relationship_id].present?
        a = VendorRelationship.find_by_id params[:relationship_id]
        if a.present?
          redirect_to edit_client_relationship_path(a)
        else
          respond_with resource, :location => after_update_path_for(resource)
        end
      else
        respond_with resource, :location => after_update_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
end
