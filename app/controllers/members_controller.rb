class MembersController < ApplicationController
  def index
    render json: Member.all
  end

  def create
    member = Member.create!({
      first_name: params[:first_name],
      last_name: params[:last_name],
      url: params[:url]  
    })
    render json: member
  end

  def show
    render json: Member.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
