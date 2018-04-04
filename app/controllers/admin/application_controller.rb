class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin/admin".freeze

  private

    # Redirect to an Active Record instance's #show Action, and set a
    #  successful flash message.
    def redirect_to_model_save(model)
      redirect_to [:admin, model],
        notice: I18n.t(:successful_model_save, scope: [:admin, :crud], model_name: model.class.name)
    end

end
