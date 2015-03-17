class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite

    if favorite.save
      flash[:notice] = "Post added to favorites!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Post could not be added to favorites. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite

    if favorite.destroy
      flash[:notice] = "Post deleted from favorites."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Post could not be removed from favorites."
      redirect_to [@post.topic, @post]
    end
  end
end
