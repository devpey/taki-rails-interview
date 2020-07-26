class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  def index
   
    if current_business.present?
      @businesses = Business.where("id = ? ",current_user.id).all

      # @items = Item.all
     else
 
     # If business not yet created, redirect to create a new business
       redirect_to new_business_path, notice: "Please create a business."
     end

  end

  # GET /businesses/1
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to @business, notice: 'Business was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      redirect_to @business, notice: 'Business was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy
    redirect_to businesses_url, notice: 'Business was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_params
        defaults = {user_id: current_user.id}
        params.require(:business).permit(:name, :address, :city, :user_id).reverse_merge(defaults)
    end
end
