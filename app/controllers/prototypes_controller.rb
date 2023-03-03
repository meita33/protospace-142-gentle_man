class PrototypesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index 
    @prototypes = Prototype.all
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
    @comments = @prototype.comments
    @comment = Comment.new
    
  end

  def edit
  end

  def update
    @prototype.update(prototype_params)
    if @prototype.valid?
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


  private

  def prototype_params
    params.require(:prototype).permit(:title, :concept, :catchcopy, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @prototype = Prototype.find(params[:id])
    @user = @prototype.user
    redirect_to(root_path) unless @user == current_user
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end