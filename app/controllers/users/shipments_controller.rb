class Users::ShipmentsController < ApplicationController
  def new
    @head = Head.new
    # @form = Form::ProductCollection.new
    @construction = Construction.find(params[:id])
    @bodies = Body.where(construction_id: params[:id])
    @heads = Head.where(construction_id: params[:id])
    # byebug
  end

  def create
    @head = Head.new(head_params)
    # @form = Form::ProductCollection.new(product_collection_params)
    #   if @form.save
    #     redirect_to :products, notice: "#{@form.target_products.size}件の商品を登録しました。"
    #   else
    #     render :new
    #   end
    @head.created_date = Date.today
    # byebug
    @construction = Construction.find(params[:head][:construction_id])
    # byebug
    if params[:flag] == '0'
      @head.delivery = @construction.delivery_name
      @head.delivery_address = @construction.address
      @head.delivery_person = @construction.person
      @head.delivery_tel = @construction.tel
    elsif params[:flag] == '1'
    end
    @head.user_id = current_user.id
    # byebug
    @head.save!
    # @shipped.save!
    redirect_to root_path
  end

  def index
    @heads = Head.all
  end

  def destroy
    @head = Head.find(params[:id])
    @head.destroy
    redirect_to users_shipments_path
  end


  private
  def head_params
    params.require(:head).permit(
      :created_date,
      :ship_date,
      :vehicle,
      # :arrival_time,
      :unic,
      :waiting_place,
      :rain,
      :delivery,
      :delivery_person,
      :delivery_tel,
      :delivery_address,
      :order_no,
      :construction_id,
      :remark,
      :user_id
    )
  end
  def product_collection_params
    params
      .require(:form_product_collection)
      .permit(products_attributes: Form::Product::REGISTRABLE_ATTRIBUTES)
  end
end
