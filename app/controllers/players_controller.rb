class PlayersController < ApplicationController

  def edit
    @change_player = Player.find(params[:id])
  end

  def update
    @change_player = Player.find(params[:id])
    if @change_player.update_attributes(player_params)
      redirect_to players_path
    else
      render 'edit'
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def index
    @all_player = Player.all
    @all_participations = Participation.all
  end

  def new
    @new_player = Player.new
  end

  def create
    @new_player= Player.new(player_params)
      if @new_player.save
        redirect_to players_path
      else
        render 'new'
      end
  end

  def destroy
    if Player.destroy(params[:id])
      redirect_to players_path
    else
      flash[:error] = "Nie można usunąć - gracz bierze udział w rozgrywce"
      redirect_to players_path
    end
  end

  def search
    @player = Player.where("nickname ~* ?", "#{params[:text]}[a-b]*")
    @all_participations = Participation.all
  end

  def player_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:player).permit(:nickname,:name,:surname,:age,:team_id)
  end

end
