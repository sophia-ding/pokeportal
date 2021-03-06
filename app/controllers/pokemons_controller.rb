class PokemonsController < ApplicationController

  def capture
    pokemon = Pokemon.find(params[:id])
    pokemon.trainer_id = current_trainer.id
    pokemon.save
    redirect_to root_path
  end

  def damage
    pokemon = Pokemon.find(params[:id])
    pokemon.health = pokemon.health - 10
    if pokemon.health <= 0
      pokemon.destroy
    end
    pokemon.save
    redirect_to trainer_path(id: current_trainer.id)
  end

  def create
    pokemon = Pokemon.create(pokemon_params)
    pokemon.health = 100
    pokemon.level = 1
    pokemon.trainer_id = current_trainer.id
    pokemon.save
    redirect_to trainer_path(id: current_trainer.id)
  end

  def new
    @pokemon = Pokemon.new
  end

  private
  def pokemon_params
     params.require(:pokemon).permit(:name, :ndex)
  end

end
