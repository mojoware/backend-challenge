class MembersController < ApplicationController
  def index
    render json: Member.all.order(:id)
  end

  def create
    render json: Member.create!(member_params)
  end

  def show
    render json: Member.find(params[:id])
  end

  def update
    render json: Member.find(params[:id]).update(member_params)
  end

  def destroy
    render json: Member.find(params[:id]).destroy
  end

  private

  def member_params
    params.require(:member).permit(:id, :first_name, :last_name, :url, :shortened_url)
  end

end
