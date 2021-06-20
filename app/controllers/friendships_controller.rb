class FriendshipsController < ApplicationController
  def index
    render json: Friendship.all.order(:id)
  end

  def create
    friendship = Friendship.create!(friendship_params)
    render json: friendship
  end

  def show
    render json: Friendship.find(params[:id])
  end

  def update
    render json: Friendship.find(params[:id]).update(friendship_params)
  end

  def destroy
    render json: Friendship.find(params[:id]).destroy
  end

  private

  def friendship_params
    params.require(:friendship).permit(:member_id, :friend_id)
  end 

end
