class ApplicationController < ActionController::Base
 rescue_from ActiveRecord::RecordNotFound ,with: :record_not_found
 layout :layout_by_resource

 private
 def record_not_found
   render file:"#{Rails.root}/public/404.html",
          layout: false,
          status: 404
 end
 def layout_by_resource
  if devise_controller? && resource_name == :manager
    "managers"
  else
    "application"
  end
end
end
