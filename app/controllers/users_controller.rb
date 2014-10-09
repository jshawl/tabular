class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @organizations = current_user.organizations
  end

end