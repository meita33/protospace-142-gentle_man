class PrototypesController < ApplicationController
  
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
    @prototype = Prototype.find(parsms[:id])
  end

  def update
    prototype = Prototype.find(parsms[:id])
    prototype.update(prototype_params)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :concept, :catchcopy, :image, :name).merge(user_id: current_user.id)
  end
end