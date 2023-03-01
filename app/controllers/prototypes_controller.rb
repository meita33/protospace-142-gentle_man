class PrototypesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index 
    @prototypes = Prototype.all
    # @prototype = User.new[:name] 
    # Prototype.includes(:user).order("created_at DESC")
    
  end

  def new
    @prototype = Prototype.new

  end

  def create
    @prototype = Prototype.new(prototype_params) 
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.valid?
      redirect_to prototype_path
    else
      render :edit
    end

    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :concept, :catchcopy, :image, :name).merge(user_id: current_user.id)
  end

  def correct_user
    @prototype = Prototype.find(params[:id])
    @user = @prototype.user
    redirect_to(root_path) unless @user == current_user
  end
end