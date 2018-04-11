class Admin::VendorsController < Admin::ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.includes(:avatar).find(params[:id])
  end

  def new
    @avatar = Avatar.find params[:avatar_id]
    @vendor = @avatar.vendors.build
  end

  def create
    @avatar = Avatar.find params[:avatar_id]
    @vendor = @avatar.vendors.build vendor_params

    redirect_to_nested_model_save([@avatar, @vendor]) and return if @vendor.save

    render :new
  end

  def edit
    @vendor = Vendor.includes(:avatar).find(params[:id])
    @avatar = @vendor.avatar
  end

  def update
    @vendor = Vendor.includes(:avatar).find(params[:id])

    redirect_to_nested_model_save([@vendor.avatar, @vendor]) and return if @vendor.update_attributes(vendor_params)

    render :edit
  end

  def destroy
    redirect_to admin_vendors_path if Vendor.find(params[:id]).destroy
  end

  private

    def vendor_params
      params.require(:vendor).permit(:name, :town, :description)
    end

end
