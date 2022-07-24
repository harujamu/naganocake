class Admin::GenresController < ApplicationController
  
  def index
    @genre_new = Genre.new
    @genres = Genre.all
  
  end
  
  def create
    
     @genre_new = Genre.new
  end

  def edit
    @genre = Genre(params:id)
  end
  
  def update
    @genre = Genre(params:id)
  end
    
end
