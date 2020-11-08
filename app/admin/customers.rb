ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :fullname, :phonenumber, :email, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:fullname, :phonenumber, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :fullname, :phonenumber, :email, :notes, :image

  # DSL Domain Specific Language
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size: "200") : ""
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
