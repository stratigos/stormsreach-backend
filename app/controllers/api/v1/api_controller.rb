class Api::V1::ApiController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def record_not_found(error=nil)
      render json: { errors: [I18n.t(:resource_not_found_generic, scope: [:api, :errors])] }, status: :not_found
    end

    def render_successful_creation
      render json: { success: true }, status: :created
    end

    def render_successful_put
      head :no_content and return
    end

    def render_model_errors_unprocessable_entity(model)
      render json: { errors: model.errors.full_messages }, status: :unprocessable_entity
    end
end
