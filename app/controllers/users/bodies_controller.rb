class Users::BodiesController < ApplicationController
  def index
    # byebug
    @construction = Construction.find(params[:construction_id])
    @body = Body.new
    @bodies = Body.where(construction_id: params[:construction_id])
  end

  def create
    # byebug
    @body = Body.new(body_params)
    # byebug
    @body.save!
    # redirect_to users_constructions_path
    redirect_to request.referer
  end

  def edit
    @body = Body.find(params[:id])
  end

  def update
    @body = Body.find(params[:id])
    @body = Body.update!(body_params)
    redirect_to users_bodies_path
  end

  def destroy
    @body = Body.find(params[:id])
    @body.destroy!
    redirect_to request.referer
  end

  private
  def body_params
    params.require(:body).permit(
      :product_name,
      :quantity,
      :format,
      :construction_id
    )
  end
end