class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
       @items = Item.where("business_id = ?", current_business.id)
       @item = Item.new
     # @items = Item.all

    else

    # If business not yet created, redirect to create a new business
      redirect_to new_business_path, notice: "Please create a business."
    end

    

  end

  def new
      @item = Item.new
  end

  def edit

  end

  def create
    # TODO: [TAKI-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
        format.js   { render 'show', location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.js { render json: @item.errors, status: :unprocessable_entity }

      end
    end

  end

  def show


  end

  def update
    # TODO: [TAKI-001] Finish the implementation of Create/Update/Delete for Items
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # TODO: [TAKI-001] Finish the implementation of Create/Update/Delete for Items
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path, notice: 'Item detalhe was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render 'show', location: @item }
    end
  end

  private


  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    defaults = {business_id: current_business.id}
    params.require(:item).permit(:name, :price, :user_id).reverse_merge(defaults)
  end


end
