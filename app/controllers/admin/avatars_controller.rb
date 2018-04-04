class Admin::AvatarsController < Admin::ApplicationController

  def index
    @avatars = Avatar.all
  end

  def show
    @avatar = Avatar.find(params[:id])
  end

  def new
    @avatar = Avatar.new
  end

  def create
    @avatar = Avatar.new(avatar_params)

    redirect_to_model_save(@avatar) and return if @avatar.save

    render :new
  end

  def edit
    @avatar = Avatar.find(params[:id])
  end

  def update
    @avatar = Avatar.find(params[:id])

    redirect_to_model_save(@avatar) and return if @avatar.update_attributes(avatar_params)

    render :edit
  end

  def destroy
    redirect_to admin_avatars_path if Avatar.find(params[:id]).destroy
  end

  private

    def avatar_params
      params.require(:avatar).permit(:name, :town)
    end

end
