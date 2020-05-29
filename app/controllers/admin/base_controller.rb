class Admin::BaseController < ApplicationController
    layout 'backend'
    before_action :authenticate_manager!
end
