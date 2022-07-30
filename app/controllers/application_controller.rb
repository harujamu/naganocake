class ApplicationController < ActionController::Base
  @genres = Genre.all
end
