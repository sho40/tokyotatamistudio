ActiveAdmin.register Product do

  permit_params :name, :image, :price, :text, :category_id, :stock

  form do |f|
    f.inputs do
      f.input :name
      f.input :image
      f.input :price
      f.input :text, as: :text
      f.input :category
      f.input :stock
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :image, :price, :text, :category_id, :stock
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :image, :price, :text, :category_id, :stock]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
