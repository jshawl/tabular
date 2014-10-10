class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def show
    @org = Organization.find( params[:id] )
    @links = @org.links
  end

end
