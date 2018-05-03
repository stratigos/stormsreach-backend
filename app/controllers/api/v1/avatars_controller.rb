class Api::V1::AvatarsController < Api::V1::ApiController

  def index
    @avatars = Avatar.order(:id)

    render json: @avatars
  end

end
