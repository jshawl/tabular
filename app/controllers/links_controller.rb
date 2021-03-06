class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /links
  # GET /links.json
  def index
    if params[:user_id]
      @links = User.find( params[:user_id] ).links
      @is_admin = User.find( params[:user_id] ) == current_user
      @name = User.find( params[:user_id] ).email
    elsif params[:organization_id]
      @org = Organization.find( params[:organization_id] )
      @name = Organization.find( params[:organization_id] ).name
      @links = @org.links
      @links = Link.all
      mem = Membership.find_by( organization: @org, user: current_user )
      @is_admin = mem && mem.is_admin
    end
  end

  # GET /links/new
  def new
    @link = Link.new
    @user = current_user
  end

  # GET /links/1/edit
  def edit
    @user = current_user
    @link = Link.find( params[:id] )
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.create(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to user_links_path( current_user ), notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to user_links_path( current_user ), notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to user_links_path( current_user ), notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url)
    end
end
