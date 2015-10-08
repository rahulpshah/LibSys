class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy, :member_history]
  before_action :checkauth?, only: [:index, :edit, :show, :destroy, :member_history, :update]
  def checkauth?
    unless is_admin? || current_user == @member
      flash[:privileges]="Not enough privileges"
      redirect_to root_path
    end
  end
  def signup
    @member = Member.new
  end
  def member_history
    if(!is_admin? && current_user != @member)
      flash[:privileges]="Not enough privileges"
      redirect_to root_path
    end
  end
  def login
  end
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @member.email.downcase!
    respond_to do |format|
      if @member.save
        #raise "error"
        if(@member.email == "123.rahul.shah@gmail.com")
          NotifyMailer.notify(@member).deliver_now
        end
        unless is_admin?
          log_in(@member)
        end
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    if @member.destroy
      respond_to do |format|
       format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
       format.json { head :no_content }
      end
    else
      redirect_to @member,notice: "Cannot delete member has active checkouts"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice:"Member not found"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :email, :password)
    end
end
