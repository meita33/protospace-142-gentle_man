class PrototypesController < ApplicationController
  
  def index 
    @prototype = User.new[:name]
  end
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