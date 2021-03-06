class AdminsController < ApplicationController
  before_action :get_admin, only: [:show, :edit, :update, :destroy]
  before_action :checkauth?
  
  def checkauth?
    unless is_admin?
      flash[:privileges]="Not enough privileges"
      redirect_to root_path
    end
  end

  # GET /admins
  # GET /admins.json
  
  def index
    h = Hash.new
    h[:id]=current_user.id
    @admins = Admin.where.not(h)
    puts @admins
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    @admin.email.downcase!
    
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    if !(@admin.editable?)
      redirect_to admins_url, notice: 'Admin can\'t be updated'
    else
      respond_to do |format|
        if @admin.update(admin_params)
          format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if @admin.destroy
      respond_to do |format|
        format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to admins_url, notice: 'Admin can\'t be destroyed.' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_admin
      @admin = Admin.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice:"Admin not found"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :email, :password)
    end
end
