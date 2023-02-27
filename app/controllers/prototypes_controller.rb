class PrototypesController < ApplicationController
  
  def index 
    @prototype = User.new[:name]
  end
end
