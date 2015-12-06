class ConventionsController < ApplicationController

  def index
    @all_conventions = Convention.all
  end

  def new
    @convention = Convention.new
  end

  def create
    convention = Convention.new(convention_params)
    convention.save
    redirect_to root_path
  end

  def convention_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:convention).permit(:name,:start,:end,:country,:level)
  end
end
