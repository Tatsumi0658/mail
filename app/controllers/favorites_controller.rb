class FavoritesController < ApplicationController
  def create
    favorite = current_profile.favorites.create(post_id: params[:post_id])
    redirect_to posts_path
  end

  def destroy
    favorite = current_profile.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end

  def show
    @fav = Favorite.where(profile_id: current_profile.id).all
  end
end
